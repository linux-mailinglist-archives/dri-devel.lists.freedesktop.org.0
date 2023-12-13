Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E009810C3A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 09:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A0A10E726;
	Wed, 13 Dec 2023 08:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Wed, 13 Dec 2023 03:51:05 UTC
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A064710E013
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 03:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1702438559; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hK4Hiz4nx65ev563xX5ZencFyZCpZWoPwq23hysUuWFbyfwDbrAFhSK9/SW8fxVoftF+9gLEXAKGVkRj2vSqKKnK3hgIDuiDMtqy4gsHgg9to3PRyF4KSDVUKeS9k+EQ9bnSyxU1d2KKi/1RhrOCrukdbl7vvXtHZkHxeHpN2To=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1702438559;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HuWh4qmbphVRX+L76rSigHxLLbTFyvF8fa701hSY5lI=; 
 b=IinN9cnI340BhT1jdek2J2vT8j1vxk5f/NCCu896ZzLx/Gbm7+HgjE/z1yCMj2opJU4sou6hk4E/ChwJt7ijsiyNlQON/3GGqVM+WRRthtnw7WaeKD47L+dTge1/8vx5y37Z+x7DFmBS7I/kZp5Tm1oSnJgIVSGe4f0zzAgHvlo=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1702438559; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Feedback-ID:Reply-To;
 bh=HuWh4qmbphVRX+L76rSigHxLLbTFyvF8fa701hSY5lI=;
 b=WZHV/Vq/oDEQXpufllSG7HohB+e1c2yvu9eh7o+DgFbMxG6srqP+RKWNFugs7Bs1
 c6NBCEW80d6aFLSXgCOg8nb6CCjv10IBg47H0FZpWeAV+O1337Gg3rvJW6k1wulV3Ns
 QgreJiKxK7jzzbJJTKb45Cb/bJ3S2jH0F3oG8X8w=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1702438551717925.4699308920207;
 Tue, 12 Dec 2023 19:35:51 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Tue, 12 Dec 2023 19:35:51 -0800 (PST)
Date: Tue, 12 Dec 2023 22:35:51 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "Borislav Petkov" <bp@alien8.de>
Message-Id: <18c613ec092.ae61cf7d6029.4389632938517239705@zoho.com>
In-Reply-To: <20231212224037.GAZXjhZUDeoq50xKJ5@fat_crate.local>
References: <20231111120323.GAZU9tiw8e0RSzCGB9@fat_crate.local>
 <20231212224037.GAZXjhZUDeoq50xKJ5@fat_crate.local>
Subject: Re: nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_16953_1356003501.1702438551698"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112285d827e5c45a13e041e214f7600003d7743f64b06437c4050045f5d38a4372176b890d177f49fd626:zu08011227b40ee59a3be902460748c0e500009f5484675823e4de5a17e0694872081b8547938c4338ecfc0f:rf08011231b7c4bcf7de8aa555d2d80ec70000a8b4cc4c8d64552c0936069b6604e8a64c5b13f1030e0ee2d9b6a5465d1ef24c1f2a64:ZohoMail
X-Mailman-Approved-At: Wed, 13 Dec 2023 08:19:05 +0000
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------=_Part_16953_1356003501.1702438551698
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

https://gitlab.freedesktop.org/drm/nouveau/-/issues/282
------=_Part_16953_1356003501.1702438551698
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head><meta content="text/html;charset=UTF-8" http-equiv="Content-Type"></head><body ><div style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;"><div><a target="_blank" href="https://gitlab.freedesktop.org/drm/nouveau/-/issues/282">https://gitlab.freedesktop.org/drm/nouveau/-/issues/282</a><br></div><div><br></div><div><br></div></div><br></body></html>
------=_Part_16953_1356003501.1702438551698--

