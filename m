Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07063189
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E9D89D8D;
	Tue,  9 Jul 2019 07:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172AF89E05
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 16:56:57 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b3so5268911plr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 09:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=h9r+VBBTVWSCdJBffHlUJNCOFtycb1gerbLXlsMiOzY=;
 b=bXeI4+7UQDRPTQNkNubrRvmud8MtXegwglUIdPPs0/jUtaRmyrEPCME9sHdUkgKb67
 7fMefqVQkIYvYC35XaKUFAbAuQs+wYZm4nE4tcHAKz6cDsRufpnPeFUCTJTpCjRRxEi7
 n6GlaF0GZv/pWiiCkXFXnxxHGGUVsRV3/rvXqxsHa4MnQH4kJS3ZUfQ8Q8FzL8Na/MVM
 z93mp0y2+9PJ+bof6vVcgNY/ml9LSqqoDu/14Dl9FfkiIJ4QZ1x9+PCnvFIleGpAL/ZQ
 CgXMjJqqBlUbSftxM2lPVW+5Ez8AuJ5sMZWR+RZi2s1C6hoZbNpdC98Wfn4Ykyx/mFbG
 t8RQ==
X-Gm-Message-State: APjAAAXCKlEnBil67UugPUKvpKnkQYC8CSuuYawmjOubB2L4/5Sf/gXG
 A/v/h+SlS0AaL5+aMCOI0pTBcu1e
X-Google-Smtp-Source: APXvYqzHvGmppRrzPEjtQdPhP/3o9PUDcn9diLtmnLjouaYphDPcfrmI2K9TbM9LgJHSch9egv+XrA==
X-Received: by 2002:a17:902:6b07:: with SMTP id
 o7mr25722173plk.180.1562605016733; 
 Mon, 08 Jul 2019 09:56:56 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id h21sm15908389pgg.75.2019.07.08.09.56.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 09:56:56 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 0/2] Add Sharp panel option for Lenovo Miix 630
Date: Mon,  8 Jul 2019 09:56:47 -0700
Message-Id: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=h9r+VBBTVWSCdJBffHlUJNCOFtycb1gerbLXlsMiOzY=;
 b=tEwy1HFLIrJ5CWhvDLpbBbZ+CJNNht4hGoux3ys80/gp7vDn6CgdhRPYX2Kfj+kik2
 7A5AWAZkH2tV6SPHyXjGafKxqgwCVjZeiTtkEjxk6V+m1yAjOPaZItx7sai5eH8qlv1w
 cOF3pQ29AoByWfQY/CbZZoI/YzLZeB6ZbkLVAEoH/MIEpeEMPjvUZv/9cABGlwBDCIBh
 NQEBiP52svk5Y1P5mmLBEqjYoI75k/Dp6vh2oYw5uaSpIheDtI82dE3aOgEFy5aTVfR4
 Ki9DrvGBPjchrhQy5vyLRvcK7SNsNcTwlUK4hNjo05JDy0Y2m8AlEm6IMQlKeaCCItBn
 TZSg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIExlbm92byBNaWl4IDYzMCBsYXB0b3AgY2FuIGJlIGZvdW5kIHdpdGggb25lIG9mIHR3byBw
YW5lbHMgLSBhIEJPRQpvciBTaGFycCBvcHRpb24uICBUaGlzIGxpa2VseSBwcm92aWRlcyBvcHRp
b25zIGR1cmluZyBtYW51ZmFjdHVyaW5nLgoKVGhlc2UgcGFuZWxzIGNvbm5lY3QgdmlhIGVEUCwg
aG93ZXZlciB0aGV5IHNpdCBiZWhpbmQgYSBEU0kgdG8gZURQCmJyaWRnZSBvbiB0aGUgbGFwdG9w
LCBzbyB0aGV5IGNhbiBlYXNpbHkgYmUgaGFuZGxlZCBieSB0aGUgZXhpc3RpbmcKc2ltcGxlIHBh
bmVsIGNvZGUuCgpUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBTaGFycCBvcHRpb24u
Cgp2MjoKLXJlbW92ZWQgbm8taHBkIGZyb20gZHQgZXhhbXBsZQotYWRkZWQgLmJ1c19mb3JtYXQg
YW5kIC5idXNfZmxhZ3MgZmllbGRzIGJhc2VkIG9uIHJldmlld3MKLWFkZGVkIC5mbGFncyBhZnRl
ciBCam9ybiBwb2ludGVkIG1lIHRvIHNvbWV0aGluZyBJIG1pc3NlZAotYWRkZWQgU2FtJ3MgcmV2
aWV3ZWQtYnkgdGFncwoKSmVmZnJleSBIdWdvICgyKToKICBkdC1iaW5kaW5nczogcGFuZWw6IEFk
ZCBTaGFycCBMRC1ENTExNlowMUIKICBkcm0vcGFuZWw6IHNpbXBsZTogQWRkIHN1cHBvcnQgZm9y
IFNoYXJwIExELUQ1MTE2WjAxQiBwYW5lbAoKIC4uLi9kaXNwbGF5L3BhbmVsL3NoYXJwLGxkLWQ1
MTE2ejAxYi50eHQgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2ltcGxlLmMgICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTEx
NnowMWIudHh0CgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
