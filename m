Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB35362F376
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 12:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F9C10E1AB;
	Fri, 18 Nov 2022 11:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CE810E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 11:17:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso3794753wmp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6/k+QYW5Zt+9+PgPEh+E1fdeAG1j3bZsnfC5EWxu2Dk=;
 b=IaHk/ZstcGml+8UfNgqDupHpto3ePyiOQacx4tPDiQvFR7Tn3KlJ0qE2WEDpxYok7p
 Tc9cZI7xmplBWoABtgh9G/VbAQbgGRTv223qiLFFiZnChQDx3KQXg5fN5t0nnW+j0j+x
 i4cLNLFtR6InyiQNCi7F09TuIEzZOwH8202vo7nNIEAbJEejHo+axGeX5vYzeCo+cnjT
 YsBxIw+ke4M3UBhNemTjNWgvFrq3pYAjG+OnJj0lohf9UROpa1g5w28NKWNLat0C0sOh
 g144fKJzKMmKdPio/kD2fM1M2ZqPcbkuCj+20Qc5dIjTdG9InZhVRJREqcF8gqqx7qTO
 Na9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6/k+QYW5Zt+9+PgPEh+E1fdeAG1j3bZsnfC5EWxu2Dk=;
 b=YXlmoZthKB/Z82Jzb/dctwJ8HxFXaqORWSQ6XDsqfoxOvHojIfL5kN/QH5znCLTVbi
 b9NW7I4ZwXhBiMElPHAkA6Z47lWKlJHaEhu6ekQ02AFsShAE0QKS8aPjsTyKc6F60Z8P
 8jpq1JWNUPVpJra4MJfvKTptLbJ6w5wFcUcN8AD1nvWqT7TtHgi7hraIqZfouDaXqNqp
 K9O1pfQXRdVdufDagbIndHSH4Vpi3MhzLood9YVKUauMl1Qj15e8M2hTELh5g0HM0WV0
 ANjtrQxUz5zqV17wx7NCiRP/zg5jYQV2GkcdNbPb7gTs6oSvPWnECy1VR2/EdD7qV9v0
 H+vQ==
X-Gm-Message-State: ANoB5plsKKiDHW8nUth+5mrNSyRKhuypxz0NTUMGhsXfPZ4YqwPK/I4n
 3fYOtezd2Y9f+c//zejxdwOR4Pak36fLnQ==
X-Google-Smtp-Source: AA0mqf5EnxHN/1G6IrZ1g41k0K9M9gq1D3SvanvH90A3hjwMDgm+iseOzs5NS7206GWW4NyczuQiPQ==
X-Received: by 2002:a05:600c:3ca0:b0:3cf:615f:54fb with SMTP id
 bg32-20020a05600c3ca000b003cf615f54fbmr4462686wmb.76.1668770258513; 
 Fri, 18 Nov 2022 03:17:38 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b003c83465ccbfsm9773734wmq.35.2022.11.18.03.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 03:17:37 -0800 (PST)
Date: Fri, 18 Nov 2022 14:17:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: sfr@canb.auug.org.au
Subject: [bug report] Merge branch 'for-linux-next' of
 git://anongit.freedesktop.org/drm/drm-misc
Message-ID: <Y3dpzq5o3j/iZn4Q@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Stephen Rothwell,

The patch 23b727d76bda: "Merge branch 'for-linux-next' of
git://anongit.freedesktop.org/drm/drm-misc" from Nov 17, 2022, leads
to the following Smatch static checker warning:

	drivers/gpu/drm/vc4/vc4_hdmi.c:351 vc4_hdmi_reset_link()
	error: uninitialized symbol 'vc4_hdmi'.

drivers/gpu/drm/vc4/vc4_hdmi.c
    346 
    347         crtc_state = crtc->state;
    348         if (!crtc_state->active)
    349                 return 0;
    350 
--> 351         mutex_lock(&vc4_hdmi->mutex);
                           ^^^^^^^^^
This locking

    352 
    353         vc4_hdmi = connector_to_vc4_hdmi(connector);
                ^^^^^^^^^^
needs to be done after this assignment.  But this is only in linux-next
so presumably it's a temporary thing.

    354         if (!vc4_hdmi_supports_scrambling(vc4_hdmi)) {
    355                 mutex_unlock(&vc4_hdmi->mutex);
    356                 return 0;
    357         }
    358 
    359         scrambling_needed = vc4_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_adjusted_mode,
    360                                                            vc4_hdmi->output_bpc,

regards,
dan carpenter
