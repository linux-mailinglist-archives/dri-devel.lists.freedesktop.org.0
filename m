Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAV2IlKpb2kZEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:12:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBB4728E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C6D10E5C2;
	Tue, 20 Jan 2026 11:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="Zlla2h+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E48610E5C2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:24:21 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8c2c36c10dbso602452385a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 03:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768908261; cv=none;
 d=google.com; s=arc-20240605;
 b=MZDE6xPZHU0SHanTvXpvMiK+kJF1ERqFcM0dnRIzKRycVtQCB3NoTgCj/AjRo8x4u9
 bZol4fHIBGe+0XcBmLVOEZkx4tPmXVokQ7E4MG02AUzeWhSJulAQviOto+F9yPXBUOBC
 YPpn9jr2vC6k26RhxtMqvFV1B82/NUSSxQ2NlTIV1kVEhp0oYZR5WFFGsE4s006fjWRp
 by2ObvOzRUiY0lkPQsPqOKt3rmWyDuIT2J7x4T/d5foL/oNoRJxIRUC9vsFnINkMKvy7
 gp+jWkyuvsJMCNayIWJdVLu0PpG8Ke/sSyyAY/eKd7fEPjlKPBVNk5YxodMqZcP6XY+z
 YO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Yc+Ead3PO+unG4M7qBQi+SYoKoovz03bDLJ6rIoKTZI=;
 fh=dP9bgMIJxbl46PEDzncOHo18L4un9sLdPBgwb7F14CQ=;
 b=L6BP4IkqWMOXh9Ye/Ul9/tQetd57lhFcb3TDJQnHUifnS4GrKFDeVRKk2E8cvS1XRt
 pt5dliCXoeOXgeaNuKK8KNkqKbGTsO9PcwCXmpDpI1ciDGUpg+E6bhy8Ea0+0F9Q0FV2
 pdpi+prhdkyRflB7P0CaseciOJjTYfv/r3dtxpMYyaofAiZVjUVwjMtcIUBUYd5QnVDs
 RE3khn+I4a2xIZX5rOTiSepyf52sx/Ad+NtReOsjkMyFNLwN9RP8vLWdMg4TGqxt0g8I
 r3tazVTa+OaooY0R+IUJSm7JrjX7/3j1m6eBxZC/uMcshINapLdWp1bvG17q2/F1vm4N
 8oYQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1768908261; x=1769513061;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yc+Ead3PO+unG4M7qBQi+SYoKoovz03bDLJ6rIoKTZI=;
 b=Zlla2h+YKAG47UuEr4e/KhVaclFRuZWCJXMXdcO9BxcY81q5xFfmdX3t3EDNbLfYcj
 hXfUpd0+F/YVOoxMRLsqgdq9oIa9by0RRnO7/cqZFRqc4c6Ybks//dB7VsQFyNTxJ4/I
 x6vzK4rseW05BxQ2Odqp9SJVjY/Ps2hsLMzpuPr+EnjY6RkcGukvvw5I5WSRmNhNgUr5
 CE5Z/O3vUVfdD0ncNTyAWeInuUJI2wrdruFf0hZT28jAS8pMocGkd36RzwctOwFTEhyO
 By6uHzrRsh3wNZ8xSfVgPOhGJrWPfT1sE4kw2VdPUsl3seQJQsq5elQKPxeJrJvGR92t
 tNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768908261; x=1769513061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yc+Ead3PO+unG4M7qBQi+SYoKoovz03bDLJ6rIoKTZI=;
 b=H1abI0OBxWnxQ1P2RXjGma8zmiIH5hZ0LmERL1H34ECrLytA0E0jO3NaCE8FOTq9eM
 eV+Iu6APAFMuv2cmOOb+FdQtRNciFu6+c+c2epAqOKDVZX0VYM5rtElA7kh9TF80q3vT
 NlKqH/QsHR2ZPAn4ZGiIcYQnByH05YClsD9uMBsyzS1s7AH1kByFPEKvacYmVTBsJz13
 uJJUvNw2NxdG6k3kj2QiU/w9MJfU2MjGyMZ77Y7JaRBmcPxE5qxny+N09w55lJxXwg5t
 mVMsGhL2Lv1DrHoJQ29GXCw4h6/fiRieITM++VcsDkvIUB2J0C6NlueaePAXelvDRmt0
 YBPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZMUX6RM/Sg/kxR6og2zyLghL5a3UhB6mQb7LU8wkTrw2JCgwcEVJU1s+CpxLIVxnC3Xuww7cPR90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzHLDkuvCCpQLekE/Zc3HswnEbFb72h1gmzg0xnm3jWXecAC1Q
 KlQ+AULR9mY8foNCdceyO+Ne0n1vr4vOXRzXu9AwFMnbrlcGFKcJfn3Z9SSBOlhH5E/HMkCmtbN
 lwDrAiMuoXZZRkHYp7XjUNDXYaQI8ubPDp4A23QB+Dw==
X-Gm-Gg: AY/fxX7p75dLxGp5384t2Q+gdBuebud7gFz+Ukzvrfwz3VVVmU16t/wRxXeHaxrm3qz
 8bI9ms+MtEc8R/lP4NMpFJU6+7PnGGIxcvRQg/27U90R3cpYZfXR1ijgI6G0/e9/1rCn4M1X8g1
 3niyLP40MPVDZvmoAgjs3ScjLjmQ2qTKZFSIxvEuAjAk6w8np2UyOGsapFx5QHq+nWlzuDMFmvt
 PNvJf6EFwEcAIL0ej0cEEp1DqO7rijEniJ1ywi2HDVJAdFJrzDIciuhnZyHF8HjufL0
X-Received: by 2002:a05:622a:293:b0:4ed:b012:9706 with SMTP id
 d75a77b69052e-502d8560e22mr15738471cf.43.1768908260643; Tue, 20 Jan 2026
 03:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20260109005821.225235-1-andyshrk@163.com>
 <CAPj87rPYsD9bp7Ep=fBb2ViOzSnWCgWNJ7Hj=WZuDR+OTNpnSQ@mail.gmail.com>
In-Reply-To: <CAPj87rPYsD9bp7Ep=fBb2ViOzSnWCgWNJ7Hj=WZuDR+OTNpnSQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 11:24:09 +0000
X-Gm-Features: AZwV_QhTX82cJ3r5JB05_RUf2GPXL2PjFD8R51i19MJ8Z0EQM7Kp4Hhb5yTq2q0
Message-ID: <CAPj87rNJ_ELo0C7u5Qqqhg5br8kar+f7DjcKd6Oxkr1uETsVAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch, 
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_RECIPIENTS(0.00)[m:andyshrk@163.com,m:heiko@sntech.de,m:hjc@rock-chips.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:andy.yan@rock-chips.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[fooishbar.org];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	FREEMAIL_CC(0.00)[sntech.de,rock-chips.com,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fooishbar.org:email,fooishbar.org:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 08FBB4728E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

On Tue, 20 Jan 2026 at 11:03, Daniel Stone <daniel@fooishbar.org> wrote:
> On Fri, 9 Jan 2026 at 00:59, Andy Yan <andyshrk@163.com> wrote:
> > Filter the mode that can't output by the crtc.
> >
> > [...]
> >
> > +static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
> > +                                                const struct drm_display_mode *mode)
> > +{
> > +       struct vop2_video_port *vp = to_vop2_video_port(crtc);
> > +
> > +       if (mode->hdisplay > vp->data->max_output.width)
> > +               return MODE_BAD_HVALUE;
>
> Why not test height as well?

I see the question was answered about 45 minutes ago ... anyway, why
not as a follow-up, change struct vop_rect max_output to just a single
max_width value?

Cheers,
Daniel
