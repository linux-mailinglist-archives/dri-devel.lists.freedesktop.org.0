Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1246B06E91
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C35C10E688;
	Wed, 16 Jul 2025 07:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="LB0DLtN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-250.mail.qq.com (out203-205-221-250.mail.qq.com
 [203.205.221.250])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E61110E737
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 03:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1752637041; bh=LEOKLduKn83Hk4hJU9cdyVDUO80iRjwGRPOjQDIAj5g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LB0DLtN3qJcLOPag7PyEd9WLfd3ZDvYQibP7D0m2AZGrqbbY2ODNWnG+g8hG3wzyC
 odMiVbvp4uZZsSLjPXkChAL2p60dDvR16oRjmvrL13OdAPlngVSOZA47EInU0C3n69
 PhoDyHtRx+JWbuWrf8tfT+a2Ue0xkkmtIuqZCO5s=
Received: from VM-222-126-tencentos.localdomain ([14.116.239.33])
 by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
 id 95233899; Wed, 16 Jul 2025 11:37:18 +0800
X-QQ-mid: xmsmtpt1752637038t3ljnbpzq
Message-ID: <tencent_56A4BA7780E65A148134035CC5DB2CFFA007@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5SZ62XQeLKAxgOeEoRz+a6vTdTRn2HHdzSxRdLvtqVF8p9xXbTnW
 62wfZIha+bKQwzazc3UuOkew8GaSNXYF9EyxosjLKWBHmpbzN0126sBCDGvqk0bIUfz1Lvj9d9jP
 MZR5MByWYWFZ0+zV3LvHckAlGJruALrfYZRcjh3Eaf+BAjownX0VMv2opIDPdb13+n53sAwkmjRS
 w14n4yle16gyUkq3X0p7ev462yILd7qQUS85j/U2xQScQWHZ7WTf66xpi20D5TgrFVWda85cFmbB
 +O/t6UtXqU7SFzM9RzL0LmpB3/gA92CbFHWUsoyS8Fmutl0lB2oHp3BKPI7cGpi3W5MoRbtBK4IV
 u7/uNiqjs+tJMjDLT6YjK6HpeclkUrUnA5OVva3XA55YbzBGKVXrSybFZqdE/jEKCPB43oCxwMPi
 xpR0x4k+ThYqOewRGdKqoAAxBQTUoO3JJzIaJmjpKJmlsWFx9iTf6saOuKsGEo7w39ctR0S3dNeO
 fFIHKlLq1h17aDrxDE3XfdHUbXnye9xujdo2ks6zbesZPDEvKGbgQf0OkB2lIRLYjP590arrohzx
 LbCe7aT1mLMdM0150Kmb4616G/oTDPzDrFije1+9b81VPLF/ixczqSUDGNNADe3tZuy5WCa8aRae
 Fpa6E9y6MhpNotlnNfVitm2fqdJf4b9VC4FAaPz9AExWz9ZIiqiRV7vN3G0NMuhWjpp5dXZFaoUU
 lgrTwD3mw4IvsS3/Bgl4xv8QDTSq639/bus32Ksi2nNzYXuJNAU7aucodLnOV9A8pqGFvoZZr5NH
 JxGnyE8PU56M2JfyFZYcR/9WXSckwItejn6zmpiE0gsLFpt4OivM3VgfmekoeGeU/7kUxjwrUFQF
 eQxbX0lE9z+8sHLCd7bIV3LemrOGBA24nry27NQwFK2Kuj1ZUEICqt+SMz07bvWu/JnbXMHDw8vV
 uKu16LfTRZ8UmVvMNoW6zRDUF24GEERuGz737KDE4p6as5nZaizYXm2mTFMOHHjlNC/JoX+c0G42
 H4yD/kMa5rqLR62R/fXFd6noUycOaosvpbkqgTkW8d52AeH28NsTAF9ExRZnbDOgPAsclovTCPuT
 at3hYr
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: jackysliu <1972843537@qq.com>
To: krzk@kernel.org
Cc: 1972843537@qq.com, Austin.Zheng@amd.com, Dillon.Varone@amd.com,
 Security@tencent.com, Sung.Lee@amd.com, Wayne.Lin@amd.com,
 airlied@gmail.com, alexander.deucher@amd.com, alvin.lee2@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, joshua.aberback@amd.com,
 linux-kernel@vger.kernel.org, linux@treblig.org, mario.limonciello@amd.com,
 ryanseto@amd.com, simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Subject: Re: [PATCH v2] drm/amd/display:fix a Null pointer dereference
 vulnerability
Date: Wed, 16 Jul 2025 11:37:18 +0800
X-OQ-MSGID: <20250716033718.3981047-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <12c6632b-65b7-43da-a954-7107ac8cb1b1@kernel.org>
References: <12c6632b-65b7-43da-a954-7107ac8cb1b1@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Jul 2025 07:13:52 +0000
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

On Tue, Jul 15 2025 12:44:40 +0200  Krzysztof Kozlowski wrote:
>You should disclose that you used some AI tool for that... and that
>other report(s) was really fake finding.  People should know you
>generated it with AI, so they could make informed decision whether to
>even allocate time here.

Although this problem was detected with the help of ai and static methods,
I checked the trigger path by myself and verified this problem. 
I'll describe the ways of detection if I find other issues in the future.
Anyway, thanks for your review.

Siyang Liu

