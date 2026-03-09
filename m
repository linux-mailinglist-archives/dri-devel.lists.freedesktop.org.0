Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNY0FC7vrmkWKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:02:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B343623C5BE
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE6310E54E;
	Mon,  9 Mar 2026 16:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="hC0cZj8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E48E10E54E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 16:02:49 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5a12c19affeso5522355e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 09:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773072168; cv=none;
 d=google.com; s=arc-20240605;
 b=Aq/HVE8NDjI3XwG81YSNn7b0LTVbnE5kBRDNqV+NCNgVdJs/3j0ohCg4NHZufXIivX
 htNyMF/PYZTYTE40H555g8jehthb6byfH1ReqNq7wDTnLSZ6lbZ7tLxMzQFYwVZyY0gs
 Dpj/cCxNtCO2rNMeMFGBYbtKnmKnISpeZM0lGufrBJQId/+paIuBUdKNMRkqMzx6wOeI
 VajY8XKNWzjKN6fHZbhIN0r11d9j+NhDQShXtTI2XJrQ85NLhw94ckrJJ816a8jWcPe1
 r7fHsdUIkObkDoHeIU6+oamMIE2sVBM1vi7cnG+M18HtDm6r8AB/a8PvKd3M2GQGUVUc
 X6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aYtKkAXr7MwEbIUO516mIL9P7w8ZCaMT9gWZnWQ5y+o=;
 fh=+/WZkiE0WuCncKZP8GHhrGsNTBylUoekumJh4bVKYEw=;
 b=VAy5zfziMn19LPl4DQsWaEFTEcsyD81IhJsyHqvIJGQCYwK8+yUcfkgAtKXh55nA4X
 rhPpCKaPd5wXpEEz1tkFTj2YaNBbBbxn0OyX8F4Xe5j5wYB6qQpFPFRLkRoqqlqbkO+I
 MPx+pkAFvY/P+XFTw1oM1ArWGHhoVPoZocVX38cyoBMAdfKgKixWC2lJMf/brtC8Ej0K
 FJhRZ5v7AsqnZicgJBrTqx1WSZQWGIe5CMmkMQ1hwL9FLgji/ZcI+IHqD03lWuHiKdXp
 F9IqntoWO5udZ8hfmIQonnQ5OKZdRXfBe/2VwROo3js6MDmtFYpjoOtTisejRZurkcr4
 yQhg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1773072168; x=1773676968; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYtKkAXr7MwEbIUO516mIL9P7w8ZCaMT9gWZnWQ5y+o=;
 b=hC0cZj8Pf/vUnGSP9m94qBGNX8PmvNJNtMtiYLTdiSGdZRRY+S2mimVRY+D6tYUf3w
 VF2G8m2K823/OuO/ZtBO9ON2i7yfhTaMj1qQGgWafbm/XGbIqGIPLfG82dRV9oNitkyR
 tyec5PbwZJO/48dnRCCLG7ILEvei4NuF9WheewkqH6bMIvMY+cL3vLOa6+suyYNSmv/M
 vVcHpe3KuzDfbsUZxLPVDg0tfj4Bm5JsE6FEd33AiAQHMQ37l2DmKzGhO1tUPMDbchvQ
 ACSlWxhIa2QSE36t4HEKDjSM/ck6c4gWsqwm2MA4G0ZaruQ7GEFvpGacIeZYtPGzF5mv
 /B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773072168; x=1773676968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aYtKkAXr7MwEbIUO516mIL9P7w8ZCaMT9gWZnWQ5y+o=;
 b=LGdNnCkZF4JlAbgd+7WBAn8tSwMCb9pLacWWlfr2ye+WjXQIz2mQT+/pLhNYF2p7Yo
 8XhyBNkEwab47sLJFpBc7nnQqSjkxOyutfCOVNVehEdX+aQwV8P+d378rt+hSQizAJUb
 9BIj/KG2F9wk4EstvCSgcTAall20y5oa30btPLVYlcS3Jxuhie4oYv7Krlv+y9iskaZA
 4je6TiAWlG74N43G5YHttIi4IIOZRBwIjbdeM2QWlmCf2NTHXJQzokv+VDwEyjgPH3nq
 6g0QgjprI1ZhN+pEcyXL7t8EMtdDP4SsWwsmK7ERn3CiLO43dbchbZScDKyP0QLN615d
 RhhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Zxr+DQrdj6NK9qALrPBYeCFFLQ46qb3J6ytG+NyDQNzq/RkIzBZ703LbqRsnRUfYzOChovbuXgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4wNLE0wC9LoH6zdbyV6JP5J5mNdLdZU+xo5Er9EP3JqOaLCho
 8O/fW0UwJTyb5Xv0aTkAGQxsV61U65YhnQ1nnkNkvfCEDroIm8VkLsvYJ4G9+hBbG52d9SoqRXT
 0U3O5XJEAMyU2xwd2I9i5ioA1XqV6cB817bHdvE/XOg==
X-Gm-Gg: ATEYQzw0nzRqBC1oBwpOilsfq6mtgqlhk6RuIZ1kpFMriDF7HoulkOXQ+3XNoeq2RJx
 LZgVKEMs9AMi2WpqCrlSFqsmG8vJCwIC7eNheZ4zUGTgx+NSdYsfFmvsfxXLjuLExMPRLIlglwF
 E8vLRR43nNczrRmT3vJ0v6b5dxKANhk1Ssp2MnpJeIbZXl43j9MQkqPMmNusPcyG2vKL2nVna4/
 chQcAJFjm4epLNwQZTPcTrCSSnPH3JvjRX+582iq3KKC5O/FUgMzdo08eC0qvt3oe9luWMxJza1
 uNitOrWnfbPQ9sKzN9DUBJ7NZ3NIZOx1S0O3F9AV
X-Received: by 2002:a05:6512:638e:b0:5a1:2ffd:1504 with SMTP id
 2adb3069b0e04-5a14e45e592mr45329e87.3.1773072167730; Mon, 09 Mar 2026
 09:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251104111339.128685-1-marco.crivellari@suse.com>
In-Reply-To: <20251104111339.128685-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 9 Mar 2026 17:02:36 +0100
X-Gm-Features: AaiRm50o_YvS4RQ2hk9jAi66C3IzUFo5wTo4I-gCiLgO0uUcvqO9X_Yj-iiCFEo
Message-ID: <CAAofZF5ZOYOp8C+5-BgMOViev17_a_V1i5R3Z0jkDberBdUwkA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: B343623C5BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,intel.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.com:dkim,suse.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,

On Tue, Nov 4, 2025 at 12:13=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Gentle ping.

Thanks!

--

Marco Crivellari

L3 Support Engineer


On Tue, Nov 4, 2025 at 12:13=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>
> This lack of consistentcy cannot be addressed without refactoring the API=
.
>
> This patch continues the effort to refactor worqueue APIs, which has begu=
n
> with the change introducing new workqueues and a new alloc_workqueue flag=
:
>
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>
> system_wq should be the per-cpu workqueue, yet in this name nothing makes
> that clear, so replace system_wq with system_percpu_wq.
>
> The old wq (system_wq) will be kept for a few release cycles.
>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index a094803ba7aa..37bb8123cf9b 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2048,7 +2048,7 @@ static void it6505_start_hdcp(struct it6505 *it6505=
)
>
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
>         it6505_reset_hdcp(it6505);
> -       queue_delayed_work(system_wq, &it6505->hdcp_work,
> +       queue_delayed_work(system_percpu_wq, &it6505->hdcp_work,
>                            msecs_to_jiffies(2400));
>  }
>
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/=
ti-tfp410.c
> index b80ee089f880..85fa3f8a747e 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -115,7 +115,7 @@ static void tfp410_hpd_callback(void *arg, enum drm_c=
onnector_status status)
>  {
>         struct tfp410 *dvi =3D arg;
>
> -       mod_delayed_work(system_wq, &dvi->hpd_work,
> +       mod_delayed_work(system_percpu_wq, &dvi->hpd_work,
>                          msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
>  }
>
> --
> 2.51.1
>


--

Marco Crivellari

L3 Support Engineer
