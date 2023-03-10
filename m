Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313336B5AAD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 11:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094F310E0A7;
	Sat, 11 Mar 2023 10:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C1D10E2BD;
 Fri, 10 Mar 2023 14:05:39 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id cy23so20755702edb.12;
 Fri, 10 Mar 2023 06:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678457138;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iLhizSz8ia61+0lMbmLI0pe2qS6ODf4DwRiQ9ckWTdo=;
 b=miInNn6F2CUQoYieBI2NSKGT8/ajG3dfKT20KCnPFXEnQRaeNyxBhmF9JPXBfD6W9r
 zcbQ3HCWH4ElbRt+PfznObegLNm0zMfPOyGOrozRD8CDeGl0+lpf5vvVBuTUnLozt67X
 eE7DtBurhbFXt28STMeT53cq0fAp9kLW2qVxAGiqliqDdUxOda/CPyYB8d8emghoauMW
 JrA63iPpNBYjS0y9yLBFi8Qh9qVnDcNvbzn/H9WviSnur1Me6J9/odE2PSU58uRJV4N3
 jATurXycI3Ty+6Zf8Uwg8kEu6lu6cy4eMSJDB47oRGBpSqnFD2s5zqwtpxFpf5/DpvMf
 8WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678457138;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iLhizSz8ia61+0lMbmLI0pe2qS6ODf4DwRiQ9ckWTdo=;
 b=YXakMWON6gHm7oNs9WzMiVqJUqCdfZLRQD+VPFmIxpKLnx2PVn92rRGUif6R0t1HXf
 iYKStaFRF0C1TcvHum29l4GeZqqZ74o4PhKtJndMnBcrHxSWpi48S4qPXbjSe7w4y19O
 dB1/dkisb1UIk2sEDZs4/Pdpglg+h4DoaDJIF34BGQnr+STVgWXFOEcOuBAoKupWJggc
 oNbu6lepK2adz/cUHfgMy799SJDOQoMBNBIFwOriOWfZQUkU2ihs/sWxE+vNkIwQMS+1
 XrhVXJHp7fr7BdZK++NgnS09P+rIKgqI7fIXNM04GlmSnYqpcvy1MFaOFCUJTATtV55h
 OKng==
X-Gm-Message-State: AO0yUKW3aJpb9TGtNGpkp1Wl0U6rPSdcBpAZW4yr55JDT/LfFbuKw3Hq
 CF6exZIKp26Nbya/LSzBe72Kxtl9hjQ+k78HTUVJEPmL4EQ=
X-Google-Smtp-Source: AK7set+lTCEXGQyryaeH6WgQGibtvgtn1T6/vDnDsrH5ma8ayyGlYIGz0Fa2mQOmdQE6eVn9CM8C40X6/IhkrbK1iCo=
X-Received: by 2002:a17:906:36d6:b0:8b2:23fb:dfd8 with SMTP id
 b22-20020a17090636d600b008b223fbdfd8mr13091536ejc.12.1678457137724; Fri, 10
 Mar 2023 06:05:37 -0800 (PST)
MIME-Version: 1.0
From: Brandi Gulbin <brandigulbin@gmail.com>
Date: Fri, 10 Mar 2023 08:05:26 -0600
Message-ID: <CAG2qGDhvDO1uJa5mpCJJBwXFVX5wSAcv0khMnKE2Lh5O1sz-bw@mail.gmail.com>
Subject: Re: [PATCH 3/4] x86/PCI: Enable a 64bit BAR on AMD Family 15h (Models
 30h-3fh) Processors
To: deathsimple@vodafone.de
Content-Type: multipart/alternative; boundary="00000000000076ff0c05f68c41bc"
X-Mailman-Approved-At: Sat, 11 Mar 2023 10:52:10 +0000
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 helgaas@kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000076ff0c05f68c41bc
Content-Type: text/plain; charset="UTF-8"

-- 
Brandi B Gulbin

--00000000000076ff0c05f68c41bc
Content-Type: text/html; charset="UTF-8"

-- <br><div dir="ltr" class="gmail_signature" data-smartmail="gmail_signature">Brandi B Gulbin </div>

--00000000000076ff0c05f68c41bc--
