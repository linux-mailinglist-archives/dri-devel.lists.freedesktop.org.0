Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0343F9ADC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA886E97B;
	Fri, 27 Aug 2021 14:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760176E933
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:12:48 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id u15so3878023plg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=T15NdlZMMRoCEeuW2qnUiXkXVgH1zfdF1eWyTLHVIqE=;
 b=tFMWCTZkT1tRI3bnrHAICYSoUPfi5TOLS3q2pNtOGJKGiylU/AYtMU3hInHHsCRK/e
 QViF5Kc5FdZ5dUocpreR7txGnNlJFyWguGkNKYpbaLvsksVW5qi8MBf0ZOd6Wy+9Wg2e
 yOgwD3Kn+G6Gz5CSxqg9TG4h1iYWDYJmKf8lWRbqxcjhc+rqd58lDLoIVq+4/UYzpM1r
 inhlTH4KG7hdekepDLg17uINltdwjVyfRgo4RVslLs2sazP9SNQF9ByVGUFxCxPwdVVl
 PRYO/nrbpxq93OHyd308pe2nsQDsohdxGmjypOwSdppBsaoMZycSBt3eU/TrvUOFfjo9
 QRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=T15NdlZMMRoCEeuW2qnUiXkXVgH1zfdF1eWyTLHVIqE=;
 b=n6niI5TqNa84gWc1uRI8Tlq6THzjPukKTBfmOO0cmujyn5Uay6Y8hP4wmpAEsh1zBm
 +mVDDCrHvdwdYj8Yayzv3xDqfs/pS+Jf/OgJyvArA7BWagOwg2efPtMMUwT16sCu9BoH
 gBqmSE7/CaCXPVkpAdJoItft70BdswA3lgAiyAE4KD4pO3x4AxTpkUAlYLvMDfNMAGu7
 zU1/41Ww54tnpGchghxDFtTLyFLf2Bd1aQ5WwrGgAs2bYqza/YDEGqxUfZlP/dWmOI3L
 Z3aN1tepz/7Cd/IqHw4qMs/0KWKPOMvdCuIAhr/Rlz2Rr+RJPd0sQhiktpPP7Ed9RpvF
 vc7w==
X-Gm-Message-State: AOAM5304FeLG16Ob7PA7NSq7X8YI1AHT0Y264VxPrYTG/wLV0zC3hVEz
 bkDIkOYAacco5cfCxq2dcDhDkSjRfVPjQ3ZpZE/fBeBtaIg=
X-Google-Smtp-Source: ABdhPJy169Xz+X0HIcK/gMs98m/AgDtuHIfk6Lji713rXgIleIiXTrX7Vl3O9lB0DmCmpN2kZT/oGJ+gF4LukikiwXM=
X-Received: by 2002:a17:903:2349:b0:12d:ada3:192e with SMTP id
 c9-20020a170903234900b0012dada3192emr8556564plh.3.1630069968016; Fri, 27 Aug
 2021 06:12:48 -0700 (PDT)
MIME-Version: 1.0
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Fri, 27 Aug 2021 16:12:36 +0300
Message-ID: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
Subject: DE2.0 YV12 playback issues after ea067aee45a8
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 27 Aug 2021 14:26:25 +0000
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

Hello Jernej,

During local testing I faced an issue where YV12 buffers are displayed
all in blue.

Issue can be fixed by reverting:
ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")

Could you have a look please?

Best regards,
Roman Stratiienko
