Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B2215321
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA826E2D1;
	Mon,  6 Jul 2020 07:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C921E6E40C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r12so35257092wrj.13
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aa8te2AcMwPmqAg9uKOXlMlgp9vWL13NU2V3cR52oIU=;
 b=c6T23DJJiHs5BtAKmNutM8G+MKEe23gN/maB70SgfCaol8AfeQQ+G8TYIru7RAFnVe
 gykZWTU2QlbC2rnUKQ/HBeKg6xs9YsgBm40QwJ4zwhH7b6V/7Ao2HCNFemANB9rdpmz1
 JGS92y/SEVnqf6Q069alN55283PDakjsnw6ojaeK8uFh2m9hWHymIla+yylDoYHDNT/J
 oXEdNQuVRJCH3VP1rH1BurCJaDG1gwBa5NraMYbPyV3H/2Y5auqTzHfV9RYBjfUEwO+T
 f57qbaQfqFsW5tAD7qITLW8NpanEznAi0SVdgUU+uetvWDuteTw9g9xAGH31Gb+MZ49G
 3t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aa8te2AcMwPmqAg9uKOXlMlgp9vWL13NU2V3cR52oIU=;
 b=F+5SCnOQT5G+DdvC5TVTfPof6UGDuzWSOgro5RY080YAvtE+C63ob+7oxvhkfqIKj9
 0PkJO3wOU3M6jC/aQHddnB/LvnvqHzGpSdHkP4+c8OuONdC2yhFFPPs9BvrI+gGQbVYE
 xYWmHnhz9gX0Tzcc2rXXZowBNdazGxY+gXZF+mH65kbrHSHRAfRV2lbr2887ThQLAbnY
 /jgsXrwKyeo3sMJdpSNYiHCnzAyi/Qae9LNxeM2AfzbUiFZ1QoABD9wuAkBWNgEuUzh6
 l5Hv+p89ebJKzy+yU1ZkmE+TtnGqGz8L956kvNbh452KwhzUpgnLJpwmpQ2ji10hDBw1
 LzaQ==
X-Gm-Message-State: AOAM531WhQ6ARah8D4seIUFUMwcoYCEYM3OGrNLpcF4Us+t/wnLA+v1b
 RzBdnet0LPgKjCU0XMDxVkw=
X-Google-Smtp-Source: ABdhPJwTY8xk+AwUuvBq2SX6rifzkA/0NydoFJzAmeI9i+CYuQQd2tXt9uKF7RQQ7yyoYhGi5RfQZA==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr42893726wrm.40.1593858354417; 
 Sat, 04 Jul 2020 03:25:54 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 11/14] arm64: defconfig: Enable devfreq cooling device
Date: Sat,  4 Jul 2020 12:25:32 +0200
Message-Id: <20200704102535.189647-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGV2ZnJlcSBjb29saW5nIGRldmljZSBmcmFtZXdvcmsgaXMgdXNlZCBpbiBQYW5mcm9zdAp0byB0
aHJvdHRsZSBHUFUgaW4gb3JkZXIgdG8gcmVndWxhdGUgaXRzIHRlbXBlcmF0dXJlLgoKRW5hYmxl
IHRoaXMgZHJpdmVyIGZvciBBUk02NCBTb0MuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6ly
b24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25m
aWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
CmluZGV4IDg4M2U4YmFjZTNlZC4uMWI3ZjlmZmRjMzE0IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0
L2NvbmZpZ3MvZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKQEAg
LTUwMSw2ICs1MDEsNyBAQCBDT05GSUdfU0VOU09SU19JTkEyWFg9bQogQ09ORklHX1NFTlNPUlNf
SU5BMzIyMT1tCiBDT05GSUdfVEhFUk1BTF9HT1ZfUE9XRVJfQUxMT0NBVE9SPXkKIENPTkZJR19D
UFVfVEhFUk1BTD15CitDT05GSUdfREVWRlJFUV9USEVSTUFMPXkKIENPTkZJR19USEVSTUFMX0VN
VUxBVElPTj15CiBDT05GSUdfUU9SSVFfVEhFUk1BTD1tCiBDT05GSUdfU1VOOElfVEhFUk1BTD15
Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
