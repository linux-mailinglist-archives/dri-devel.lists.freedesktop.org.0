Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68749689D7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 16:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A006C10E31A;
	Mon,  2 Sep 2024 14:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JwRT39IX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10A310E2F2;
 Mon,  2 Sep 2024 13:57:27 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so488761166b.0; 
 Mon, 02 Sep 2024 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725285446; x=1725890246; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BV+O7M8oULfIhJRN2lRrBn6twXcR7F/jAfDi0cilw7U=;
 b=JwRT39IXm87iPbIgGgvVI3azwXgCGtCW3evCSEQDojwv6GJeLsOzVU5EEq+2T5zz6c
 9V7mHV7tfcCgtvq1zrt/+ExybknO8hbxh0Pl958ixtXF7hzpVhewXlFwLUlnFfmtxPk4
 TgHUxmZy8tRMpz9VspUVf/HAsjavzGdM9RzFvNXa489RN/GZ3As8E8QDiVnJT7ksL5yU
 lcS0Q6Z9EotrBg1YqDwZqxeyh+D8bvMMbGzTScCGiaonIGmE+8ipYI2qrcD50e1EY27x
 AHTG5BZ9TWxOgve8rX1HgMLtiJ0j/nABcRSiidGIRB+OUEYVSLbAncvufq/Cgli+50OE
 RyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725285446; x=1725890246;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BV+O7M8oULfIhJRN2lRrBn6twXcR7F/jAfDi0cilw7U=;
 b=BHM7mR+4W+qVKqM+OhGeTf1gc6kLhCU5bkc+dE5/nos3slEOHaPvemg2uXCJGr7N1k
 Uk0U/ECXcL5ddjQnTUJdg+9vx4NpRzD2dpA0BWqDIiVX7elqfiEP4RRXpmS08YdiPCN5
 rGw3n0S+yxv/QHkw9SsBxgj/1EsIumqg4Ut9RXgS9UEh4D/nAjiKpGMs8qWkkhbqqzD0
 6XgBphzkYgkZJtyfDhGjQfzamLStT1kiDFbLLBQGeieJApEKkHMTjPC/TSfhHeuBexq5
 8pVN/JPzFk2WTf8ZMolppkGaXh/xVOMVPgdE6KI1mb9TRffdauzXDZvViV8jEoC+3FFm
 sfEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYvBK4eQEaTfmZnZbyc0CZIVEYi2+OPRh9gd4YnrN4QOtWsRjvn1M9JEeN6vNplPeLygergt5P@lists.freedesktop.org,
 AJvYcCWCn2KiMiZ0HFBuj/QhqYYYbXCnsVIfpSiIxrmkHDBNVyoDV1zp2gtZgX6kDlPiOM0577rgr/5jn3w+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2w3qkyQAfVqEovbVT9YZrQkQ6i/vA8rqOenJyRZljf9ejBfwB
 GmINDplWKdhK6FTeO7IWW3/T+l73QK/OPgSJ8VRSHWXhnHHsnisSkRPxFeA0j/bxtYbJ0cFMcI6
 8X0aRnh2bZoIPTBJuJuU+Y9fr34s=
X-Google-Smtp-Source: AGHT+IEgsUizls4YV3Wz076LNPYJRwRrkEPhUgnLUD7VssH9O4VKzpHO4F6UKh+5du6yth3Z4gIE/sPONdQg7n4AuTA=
X-Received: by 2002:a17:907:980f:b0:a86:7af3:8299 with SMTP id
 a640c23a62f3a-a8a1d2c8675mr18489666b.25.1725285445670; Mon, 02 Sep 2024
 06:57:25 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Raoul_van_R=C3=BCschen?= <raoul.van.rueschen@gmail.com>
Date: Mon, 2 Sep 2024 15:57:14 +0200
Message-ID: <CACsO7R=UU7Y6wdSFsUbKzhERjz+OwEqA+NaC+P=poepbP5QeMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Avoid race between dcn10_set_drr()
 and dc_state_destruct()
To: tjakobi@math.uni-bielefeld.de
Cc: Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, 
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, linux-kernel@vger.kernel.org, 
 mario.limonciello@amd.com, sunpeng.li@amd.com
Content-Type: multipart/alternative; boundary="0000000000002025b8062123520b"
X-Mailman-Approved-At: Mon, 02 Sep 2024 14:24:34 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002025b8062123520b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> dc_state_destruct() nulls the resource context of the DC state. The
> pipe
> context passed to dcn10_set_drr() is a member of this resource
> context.
>
> If dc_state_destruct() is called parallel to the IRQ processing
> (which
> calls dcn10_set_drr() at some point), we can end up using already
> nulled
> function callback fields of struct stream_resource.
>
> The logic in dcn10_set_drr() already tries to avoid this, by checking
> tg
> against NULL. But if the nulling happens exactly after the NULL check
> and
> before the next access, then we get a race.
>
> Avoid this by copying tg first to a local variable, and then use this
> variable for all the operations. This should work, as long as nobody
> frees the resource pool where the timing generators live.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3142
> Fixes: 06ad7e164256 ("drm/amd/display: Destroy DC context while
> keeping DML and DML2")
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++------
> --
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> index 3306684e805a..da8f2cb3c5db 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> @@ -3223,15 +3223,19 @@ void dcn10_set_drr(struct pipe_ctx
> **pipe_ctx,
>  	 * as well.
>  	 */
>  	for (i =3D 0; i < num_pipes; i++) {
> -		if ((pipe_ctx[i]->stream_res.tg !=3D NULL) &&
> pipe_ctx[i]->stream_res.tg->funcs) {
> -			if (pipe_ctx[i]->stream_res.tg->funcs-
> >set_drr)
> -				pipe_ctx[i]->stream_res.tg->funcs-
> >set_drr(
> -					pipe_ctx[i]->stream_res.tg,
> &params);
> +		/* dc_state_destruct() might null the stream
> resources, so fetch tg
> +		 * here first to avoid a race condition. The
> lifetime of the pointee
> +		 * itself (the timing_generator object) is not a
> problem here.
> +		 */
> +		struct timing_generator *tg =3D pipe_ctx[i]-
> >stream_res.tg;
> +
> +		if ((tg !=3D NULL) && tg->funcs) {
> +			if (tg->funcs->set_drr)
> +				tg->funcs->set_drr(tg, &params);
>  			if (adjust.v_total_max !=3D 0 &&
> adjust.v_total_min !=3D 0)
> -				if (pipe_ctx[i]->stream_res.tg-
> >funcs->set_static_screen_control)
> -					pipe_ctx[i]->stream_res.tg-
> >funcs->set_static_screen_control(
> -						pipe_ctx[i]-
> >stream_res.tg,
> -						event_triggers,
> num_frames);
> +				if (tg->funcs-
> >set_static_screen_control)
> +					tg->funcs-
> >set_static_screen_control(
> +						tg, event_triggers,
> num_frames);
>  		}
>  	}
>  }

This fixes full system freezes when taking screenshots at low
framerates with VRR enabled on an RX 7900 XTX.

Tested-by: Raoul van R=C3=BCschen <raoul.van.rueschen@gmail.com>

--0000000000002025b8062123520b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div><pre><span class=3D"gmail-q">&gt; From=
: Tobias Jakobi &lt;<a href=3D"mailto:tjakobi@math.uni-bielefeld.de">tjakob=
i@math.uni-bielefeld.de</a>&gt;
&gt;=20
&gt; dc_state_destruct() nulls the resource context of the DC state. The
&gt; pipe
&gt; context passed to dcn10_set_drr() is a member of this resource
&gt; context.
&gt;=20
&gt; If dc_state_destruct() is called parallel to the IRQ processing
&gt; (which
&gt; calls dcn10_set_drr() at some point), we can end up using already
&gt; nulled
&gt; function callback fields of struct stream_resource.
&gt;=20
&gt; The logic in dcn10_set_drr() already tries to avoid this, by checking
&gt; tg
&gt; against NULL. But if the nulling happens exactly after the NULL check
&gt; and
&gt; before the next access, then we get a race.
&gt;=20
&gt; Avoid this by copying tg first to a local variable, and then use this
&gt; variable for all the operations. This should work, as long as nobody
&gt; frees the resource pool where the timing generators live.
&gt;=20
&gt; Closes: <a href=3D"https://gitlab.freedesktop.org/drm/amd/-/issues/314=
2">https://gitlab.freedesktop.org/drm/amd/-/issues/3142</a>
&gt; Fixes: 06ad7e164256 (&quot;drm/amd/display: Destroy DC context while
&gt; keeping DML and DML2&quot;)
&gt; Signed-off-by: Tobias Jakobi &lt;<a href=3D"mailto:tjakobi@math.uni-bi=
elefeld.de">tjakobi@math.uni-bielefeld.de</a>&gt;
&gt; ---
&gt; =C2=A0.../amd/display/dc/hwss/dcn10/dcn10_hwseq.c=C2=A0=C2=A0 | 20 +++=
++++++++------
&gt; --
&gt; =C2=A01 file changed, 12 insertions(+), 8 deletions(-)
&gt;=20
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
&gt; b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
&gt; index 3306684e805a..da8f2cb3c5db 100644
&gt; --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
&gt; +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
&gt; @@ -3223,15 +3223,19 @@ void dcn10_set_drr(struct pipe_ctx
&gt; **pipe_ctx,
&gt; =C2=A0	 * as well.
&gt; =C2=A0	 */
&gt; =C2=A0	for (i =3D 0; i &lt; num_pipes; i++) {
&gt; -		if ((pipe_ctx[i]-&gt;<a href=3D"http://stream_res.tg">stream_res.tg=
</a> !=3D NULL) &amp;&amp;
&gt; pipe_ctx[i]-&gt;stream_res.tg-&gt;funcs) {
&gt; -			if (pipe_ctx[i]-&gt;stream_res.tg-&gt;funcs-
&gt; &gt;set_drr)
&gt; -				pipe_ctx[i]-&gt;stream_res.tg-&gt;funcs-
&gt; &gt;set_drr(
&gt; -					pipe_ctx[i]-&gt;<a href=3D"http://stream_res.tg">stream_res.tg</=
a>,
&gt; &amp;params);
&gt; +		/* dc_state_destruct() might null the stream
&gt; resources, so fetch tg
&gt; +		 * here first to avoid a race condition. The
&gt; lifetime of the pointee
&gt; +		 * itself (the timing_generator object) is not a
&gt; problem here.
&gt; +		 */
&gt; +		struct timing_generator *tg =3D pipe_ctx[i]-
&gt; &gt;<a href=3D"http://stream_res.tg">stream_res.tg</a>;
&gt; +
&gt; +		if ((tg !=3D NULL) &amp;&amp; tg-&gt;funcs) {
&gt; +			if (tg-&gt;funcs-&gt;set_drr)
&gt; +				tg-&gt;funcs-&gt;set_drr(tg, &amp;params);
&gt; =C2=A0			if (adjust.v_total_max !=3D 0 &amp;&amp;
&gt; adjust.v_total_min !=3D 0)
&gt; -				if (pipe_ctx[i]-&gt;stream_res.tg-
&gt; &gt;funcs-&gt;set_static_screen_control)
&gt; -					pipe_ctx[i]-&gt;stream_res.tg-
&gt; &gt;funcs-&gt;set_static_screen_control(
&gt; -						pipe_ctx[i]-
&gt; &gt;<a href=3D"http://stream_res.tg">stream_res.tg</a>,
&gt; -						event_triggers,
&gt; num_frames);
&gt; +				if (tg-&gt;funcs-
&gt; &gt;set_static_screen_control)
&gt; +					tg-&gt;funcs-
&gt; &gt;set_static_screen_control(
&gt; +						tg, event_triggers,
&gt; num_frames);
&gt; =C2=A0		}
&gt; =C2=A0	}
&gt; =C2=A0}<br><br></span></pre><pre><span class=3D"gmail-q">This fixes fu=
ll system freezes when taking screenshots at low framerates with VRR enable=
d on an RX 7900 XTX.<br></span><br>Tested-by: Raoul van R=C3=BCschen &lt;<a=
 href=3D"mailto:raoul.van.rueschen@gmail.com">raoul.van.rueschen@gmail.com<=
/a>&gt;</pre></div></div>

--0000000000002025b8062123520b--
