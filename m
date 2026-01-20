Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCZ7E6Okb2lJDwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2746C33
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D688410E5B9;
	Tue, 20 Jan 2026 11:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="oE4EVrbk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBC510E5B9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:04:10 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-88888c41a13so72415916d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 03:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907049; cv=none;
 d=google.com; s=arc-20240605;
 b=EeN9K8HL1hY2Ozc4iRTi75DzexMpL4lFdHGEU/FV5FbcBEaG4kAtZIqOXa0gTKP1XF
 L/v3einYvTNKpNRHSzDS/3CGWjkyTYy4S5fjQIs5kQtc2JCIBItkVkH5yVPr2ntnydxk
 RQr1IzsD3vjfGz08inyHxCvl82hBjL+f8/0QIZgPpPRUC9cssPB7G/5JL5M5vXschR4f
 kz2p+hfc7pkQd1VbHqC24NAlV+SUYB0zdqxEP26Hr7xuENHAAafUeeqPgpug+Su4xz1u
 HjPN+HE9wJ2TyV658tsE37wOynk5bRNvHGUgp+sL/WRau/TDzSG2ULIm2tNVJz6jqhHR
 QKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1WFMJIykjeDUwTLAnV/91H11zpuB8UJJKa8bgoRktHs=;
 fh=vxq8/czpF7s/hEY9yX/CZwI9TFoxcJuTJlI6p8EAr3E=;
 b=QzXWcyfsUf6ljYeI+B/BFjwEgm7lJOz1e9MwlQIWEyV2DlJhtIl9BCHjvS6Iad1GJe
 ph6/tMC6nYMMKjtXORG5eR2i1Pxl17itYBYRZbX9grY6bvbRalQGRiEa/gAN4Mx853Dj
 72CUbodKrW9PThva0KvGj5Q4DdocBmEemHMu1SUPUSU+O6S/zceNmLypMq3RYugFNh1D
 Mkw/QZng9z8PbbChHlf0COYX2CYIyz/DhjNlhzqHES8Ft/OIJ9bNa62o7UCA10mXABCT
 a7HBfeSBL6w2QrqqVmUdBUVYE2ITBlEE6FkDd/jSWaae8xl4ql/AeU64Q+zmMdwLC1Rx
 vP2Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1768907049; x=1769511849;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1WFMJIykjeDUwTLAnV/91H11zpuB8UJJKa8bgoRktHs=;
 b=oE4EVrbkL1DDknEhPnO3WakT/gxR8667BxOBHrpEZjCh5s/2iy1X74IUM8ADRLUoE+
 2SyskSNAWwC/euSz0kqXM2n7I1OmNTSI2xpEpW9Md/vwQ9oROwLex2higTLu0ng00ZNH
 vNv5qBwK+rdcXdWCViS9j7XjEGNmvWdL7d6z24rg/K9d7qw+2PhAM1YqLK9qF4+2qVQI
 H4ZtpO7TjRdE4xNt5kR8Dn5tU7CnahTV3JDjIJSVdmiPfWYe3QiT+UizITu0MEDGvDP/
 PgKJq2OuTcvg5Toc2vlq4XFFucTb3kFpIEBBLR4Zuy2QT0JhTkhyWtSgWFD225q9Uu0U
 /kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768907049; x=1769511849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1WFMJIykjeDUwTLAnV/91H11zpuB8UJJKa8bgoRktHs=;
 b=PmB5Uko46HtyBBjHvGSKXt1IN2FlgFIDGYHGkQ2YoyV1SmzaC7GeSytyRmQGsCd6+w
 nN9IYte8eVCxj4CmPSbMB7h/IzYxu1zZeHNvWcKN/hq/6PAQdeVas2fDz3k/SSgIE7zG
 a4FyXjBD9YW+e8vp2bF7tTu+xTTOhstOGqo2YvANBGR9fWAnVgI9mYHZ5AU7DWNl8QoZ
 +I40UsEdRKcsn5Q4sKiDuD968Cp12UpXcxz5mS0v+RXgAzmBqlhB8BfAVzug+Sw5kJtU
 AWcUD+t1bqCffWEUSChi4Vy9OAgRHlfw5Ryiuz2zsqcQt65HhsSXS9qRfUVT6hZJ024F
 t0+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJGcFvwp3q0a0p+2ly39Y1xl6zSomUqBihUUmfhstUf+br+7feVFWCIo+y7h3VPytY3m1R4Gfx5aM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8SE3GO1313SUuwazuwwpJpDlWR7p2aMQ3OxOtVi06e7jnCln6
 EcOauoNl98RuBZ0puZECk1ZnUIZ6N9YSl4xvSoQOqZR+WZ7AOY+aykqkz+pZ4N72iotAGZH/uZG
 l0wEgX+eAjldleMdZi9kBKGXvjulRMacFKDaCkDsqcw==
X-Gm-Gg: AZuq6aIPY4g6zFyi1wpBdr7hrgZDIOQP0Z1vdnXAE+iwdE3ToT2U1ACZpkQefhmo3xE
 tJLS/fVcvaYM4uWY5KQ5h+ITOeTQpOYpHqwyoi2PYhjpx//S7/SugtvtwPEO6yFbwbHGRw+r3Mi
 SRCb6+Wb0XycGHAODIyF4pSqqPtU7ICXG10fw4Qw+qj9rBy0FXalWh1Mo0rAv6GkH9hIAQ21a9A
 KbmnBZnIpH+h4h16H4DoogJXpAWp9FZmHS85kvqGnlU5gmp++EXAm6wtMWEc5yDo5eR
X-Received: by 2002:ad4:4eef:0:b0:88a:4694:5921 with SMTP id
 6a1803df08f44-8942ddad70fmr192050966d6.37.1768907049157; Tue, 20 Jan 2026
 03:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20260109005821.225235-1-andyshrk@163.com>
In-Reply-To: <20260109005821.225235-1-andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 11:03:57 +0000
X-Gm-Features: AZwV_Qj6ykO3irdHAAivo3zJ7fPUY3sXls4LuuJI-exbLYOzFgw_HME4X3eA2Z4
Message-ID: <CAPj87rPYsD9bp7Ep=fBb2ViOzSnWCgWNJ7Hj=WZuDR+OTNpnSQ@mail.gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[fooishbar.org:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DEB2746C33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

On Fri, 9 Jan 2026 at 00:59, Andy Yan <andyshrk@163.com> wrote:
> Filter the mode that can't output by the crtc.
>
> [...]
>
> +static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
> +                                                const struct drm_display_mode *mode)
> +{
> +       struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +
> +       if (mode->hdisplay > vp->data->max_output.width)
> +               return MODE_BAD_HVALUE;

Why not test height as well?

Cheers,
Daniel
