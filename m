Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382C3488B7A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0356410E246;
	Sun,  9 Jan 2022 17:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A203510E246
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 17:59:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r9so20745485wrg.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 09:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+7rBCXzd17ZVgtiviUmOjQDT7b/TTvfvus0D8MSi41Q=;
 b=jyORGvlDSBym/qGogERMi5dS0YBWj5RmlkJWcEIQBB+vI4iUkadk0f0K2Gwvrj9ae7
 QZ0XteuuT6XypaP0z0DYf60or7smVrSsuboRXYP8LW7D/5cUaiuJTnfhkVEy2pUAasGF
 vX0EC3sP3qd0glzYL5+BpcJWUmOsvDN7wjMn5T17no9r68FVGRYC3kWEeEbghK/oMFdw
 4MJHsoeqPcSiyR2n5uSN1wMq+um2Dh2POzdQ0FQk3CysbxL7uC5ZQebHoTLSW/E3vM/L
 wdlNSw1pEUou+NEwM6Et886pRxyj7BreKAbZswfMjiUdP/u17ILbYfVHOuCaF3SwoMIz
 cfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+7rBCXzd17ZVgtiviUmOjQDT7b/TTvfvus0D8MSi41Q=;
 b=Ez9kWUVe7O858pfIIlR4yWLuOmsYoGzXd/duH7w7FobAAGl1t8uUEt1acDitP9NmuR
 MZ8HKb4Rk2dG0iWGM9OhjIEskc03mY3ZxCuTtT80nh9t7mOYuexjng+xG5qv/gwX5brX
 Ry0C4pqKhxIwfsmXvSRNfiISq8en0yugTURkBko2wQzN60Z25XBeLC8/2d6W2aYaDIzk
 OFjLsmtpfw2T315s0uAgRBG7hBsudrfYoE1+OaSyBCO5iBW6cvpHAkgn1yNQnzQbjCto
 U0sK75Sh/iDX9o3fFY1MJiPmtcY/hxyeQoEXfFSfSV668QjIzWr5PrIoe33VW8/pi0dY
 MbMw==
X-Gm-Message-State: AOAM533zHUdi6Vtszt1TEbVk1Qs88wV3x9AhhcjdHZ6sVL4nK5uR8FH9
 dyXIJjdc4mOvWX7KTMWqVCfatlr1RfsMeA==
X-Google-Smtp-Source: ABdhPJxmlC5Y8dmmx1TuM5H5dp5Ep30gmqIb9P1pEhZ0iV18nQetZ8PObFG+bW9Ugu0jSaWl+0E0TQ==
X-Received: by 2002:adf:eb41:: with SMTP id u1mr31774653wrn.201.1641751182155; 
 Sun, 09 Jan 2022 09:59:42 -0800 (PST)
Received: from elementary ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g9sm4932377wmq.22.2022.01.09.09.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:59:41 -0800 (PST)
Date: Sun, 9 Jan 2022 18:59:31 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH RESEND v2 2/3] drm/vkms: add support for multiple overlay
 planes
Message-ID: <20220109175931.GA11065@elementary>
References: <20220107182809.141003-1-jose.exposito89@gmail.com>
 <20220107182809.141003-2-jose.exposito89@gmail.com>
 <20220109165933.sa6kpgrzdzj5r3ho@mail.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220109165933.sa6kpgrzdzj5r3ho@mail.igalia.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

Thanks for reviewing and applying the series :)

Now [1] should apply cleanly on drm-misc-next. Do you want me to resend
it with the appropriate prefix?

On Sun, Jan 09, 2022 at 03:59:55PM -0100, Melissa Wen wrote:
> I checked that several testcases from kms_cursor_crc are failing after
> recent changes in the test. However, this regression is not caused by
> these changes and need futher investigation for fixing.

I didn't include the results for kms_cursor_crc because some of the
tests cause issues on my PC. However, if you want to share the list of
regressions, I'll have a look into the test as well.

Thanks again,
José Expósito

[1] https://lore.kernel.org/all/20211226111219.27616-2-jose.exposito89@gmail.com/
