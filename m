Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9002F83B1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6F46E4B0;
	Fri, 15 Jan 2021 18:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701DD6E4D2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l12so4984416wry.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGPhURrdAfrcr7PbpwjcxwF7QYiZtJ0ThRqyiooaDBM=;
 b=e7nYyY2nViynQVTw0qCPH1uZMBKoFpKPnEbk0loJLIxWeIm19aIa6t4zpZJUQ76qbH
 sETMQNR8y68prpyoYG+MZGgwksMFqvJ8Tk+6+qAKoECjWM5GBXHFkT4xG/f5UcF26YDY
 dM29Plji930ezBILTG/C9mpVQs4PekZWEwhawyZ4KAzqU7PQbuQHosuXLVQcxsccezFY
 TEab+zsqKdNhDBV5tfUW7KDA+Knmcw8e0nkRgMsdiK6f4d8893cp/8Bxl6rfjAfgIKs2
 mpkefoeDaPbx+trLknAyGsJDIYEO2UUT04giz3JiS/QDsAYsoTvrAidVP1gYX/9sxFrw
 bLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGPhURrdAfrcr7PbpwjcxwF7QYiZtJ0ThRqyiooaDBM=;
 b=O7JkyAZx1/s9iJ3Tuv0knVDsC3sTVW7kjqTjzdXXVjTiIIDXfNyP1DtubiFtuzKAWa
 ZGJv65X7mP7oJPUme/chQIuZ77ftLkykpBzQh6MlGmG62C8vkOT+bVKLf3u/Ve26HEA6
 XB4K2PsLyiMXArF5pEqv6hs/lJPzKGicIhAddRDsCnDBpA/xXGJLd6D7PdpAfSCPt6eW
 nP8JG84Hkf0wrWgnWBRXXdvLlphwD7VNLO4y2um87IAESJ95CuYz0MVVjp6us7JEQxMb
 TV8BYCkOSDuvNiUNZnHdoBSw1ZAFnJcZcbeZieZ5+Ib5qtWlg6Kh7ICAgwcEqO3UYYTF
 R92g==
X-Gm-Message-State: AOAM5311VWitob04LfpB/gDXzlQ3ZSMqQJ/Yaxw4VnCyhvl5ycpZ4M1Z
 FXKnWkkn9VvZXTY5v1czfurAEw==
X-Google-Smtp-Source: ABdhPJylJzUx60Mk4XLdT6I+iRaNomlyZqBNDJ+ZueJbh+Hos/sho8zalnVjR4hbAg+aDtTutRVoSQ==
X-Received: by 2002:a05:6000:1088:: with SMTP id
 y8mr10266247wrw.380.1610734591117; 
 Fri, 15 Jan 2021 10:16:31 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/29] drm/gma500/oaktrail_lvds_i2c: Remove unused variables
 'tmp'
Date: Fri, 15 Jan 2021 18:15:50 +0000
Message-Id: <20210115181601.3432599-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jan Safrata <jan.nikitenko@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9sdmRzX2kyYy5jOiBJbiBmdW5jdGlvbiDigJhnZXRf
Y2xvY2vigJk6CiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2x2ZHNfaTJjLmM6Njk6
MTE6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHRtcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9sdmRz
X2kyYy5jOiBJbiBmdW5jdGlvbiDigJhnZXRfZGF0YeKAmToKIGRyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvb2FrdHJhaWxfbHZkc19pMmMuYzo4MzoxMTogd2FybmluZzogdmFyaWFibGUg4oCYdG1w4oCZ
IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogUGF0cmlr
IEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWlsLmNvbT4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
Q2M6IEphbiBTYWZyYXRhIDxqYW4ubmlraXRlbmtvQGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2x2ZHNfaTJj
LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfbHZk
c19pMmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfbHZkc19pMmMuYwppbmRl
eCBkNjRhZWRjNjk4NDVmLi4xZDJkZDZlYTFjNzE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL29ha3RyYWlsX2x2ZHNfaTJjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9vYWt0cmFpbF9sdmRzX2kyYy5jCkBAIC02NiwxMiArNjYsMTIgQEAKIHN0YXRpYyBpbnQgZ2V0
X2Nsb2NrKHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IHBzYl9pbnRlbF9pMmNfY2hhbiAqY2hhbiA9
IGRhdGE7Ci0JdTMyIHZhbCwgdG1wOworCXUzMiB2YWw7CiAKIAl2YWwgPSBMUENfUkVBRF9SRUco
Y2hhbiwgUkdJTyk7CiAJdmFsIHw9IEdQSU9fQ0xPQ0s7CiAJTFBDX1dSSVRFX1JFRyhjaGFuLCBS
R0lPLCB2YWwpOwotCXRtcCA9IExQQ19SRUFEX1JFRyhjaGFuLCBSR0xWTCk7CisJTFBDX1JFQURf
UkVHKGNoYW4sIFJHTFZMKTsKIAl2YWwgPSAoTFBDX1JFQURfUkVHKGNoYW4sIFJHTFZMKSAmIEdQ
SU9fQ0xPQ0spID8gMSA6IDA7CiAKIAlyZXR1cm4gdmFsOwpAQCAtODAsMTIgKzgwLDEyIEBAIHN0
YXRpYyBpbnQgZ2V0X2Nsb2NrKHZvaWQgKmRhdGEpCiBzdGF0aWMgaW50IGdldF9kYXRhKHZvaWQg
KmRhdGEpCiB7CiAJc3RydWN0IHBzYl9pbnRlbF9pMmNfY2hhbiAqY2hhbiA9IGRhdGE7Ci0JdTMy
IHZhbCwgdG1wOworCXUzMiB2YWw7CiAKIAl2YWwgPSBMUENfUkVBRF9SRUcoY2hhbiwgUkdJTyk7
CiAJdmFsIHw9IEdQSU9fREFUQTsKIAlMUENfV1JJVEVfUkVHKGNoYW4sIFJHSU8sIHZhbCk7Ci0J
dG1wID0gTFBDX1JFQURfUkVHKGNoYW4sIFJHTFZMKTsKKwlMUENfUkVBRF9SRUcoY2hhbiwgUkdM
VkwpOwogCXZhbCA9IChMUENfUkVBRF9SRUcoY2hhbiwgUkdMVkwpICYgR1BJT19EQVRBKSA/IDEg
OiAwOwogCiAJcmV0dXJuIHZhbDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
