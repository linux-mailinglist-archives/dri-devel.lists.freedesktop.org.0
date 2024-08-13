Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF62950D80
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 22:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F94110E332;
	Tue, 13 Aug 2024 20:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="TYWnBPuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930DF10E3F4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 20:04:00 +0000 (UTC)
Delivered-To: helen.koike@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723579434; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VLASOqiwIug16M3gAKf6RWmPhtzUtqgJGwUJSQXd2a0ESoRX6Y+Hvgh/hzi/oFAKgP9EtV0ZKjrGQGKiu4+mi1+uM2tca4Z5eAX/7Yy+w9AYyCrORilYBI1dfVA6I2ZYcDDNomo/47nzamN6gBsU63zUemMfy4UaiJtA7JYGTaI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723579434;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XL9uQ8f/R5EP8/qhQgw4feyHBSc5qQfLkNfkxE2YZjc=; 
 b=ERZvezT/70DWRuVNQ/TnPHgUvnsdctC3UuRkulPe3kmUmBZVumGxL9BKIyVsoGIQ82WV6iNjc5Mw5fJLd8oILkeLb9omol/DJ6NtkwkcCXaxcjrIVsdSUPvw6soap5D/LX3Ius5yiqIj5wKMwgMUbZR4m+mDcIJHJLwiezGJ2J0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723579434; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=XL9uQ8f/R5EP8/qhQgw4feyHBSc5qQfLkNfkxE2YZjc=;
 b=TYWnBPuTQqdhecrpDO7mBdL2lS8BRQdQGc1Wtkall98YH65PHp7sBskPidhdOpJQ
 6hrLN+DPIs9fF4lFLRpKXu0QwWs4kglKX4KH36VvMlOd/u8bnxEdkVQUL/1NGPEQl8l
 cSebmFCyVnqbkTpdcvZh3RiQqf5Zrb9ZRsFGFonY=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1723579432652338.5872011481632;
 Tue, 13 Aug 2024 13:03:52 -0700 (PDT)
Date: Tue, 13 Aug 2024 17:03:52 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Helen Koike" <helen.koike@collabora.com>
Cc: "WangYuli" <wangyuli@uniontech.com>,
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 "mripard" <mripard@kernel.org>, "tzimmermann" <tzimmermann@suse.de>,
 "airlied" <airlied@gmail.com>, "daniel" <daniel@ffwll.ch>,
 "david.heidelberg" <david.heidelberg@collabora.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "vignesh.raman" <vignesh.raman@collabora.com>,
 "torvalds" <torvalds@linux-foundation.org>,
 "guanwentao" <guanwentao@uniontech.com>
Message-ID: <1914d56fe86.f860dad0912384.3097768595392912889@collabora.com>
In-Reply-To: <f9ed4aba-9a28-4620-be5f-9060556efd93@collabora.com>
References: <0237854884D6DB3C+20240716083743.33415-1-wangyuli@uniontech.com>
 <f9ed4aba-9a28-4620-be5f-9060556efd93@collabora.com>
Subject: Re: [PATCH] drm/ci: Upgrade setuptools requirement to 70.0.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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





---- On Wed, 17 Jul 2024 08:06:18 -0300 Helen Koike  wrote ---

 > 
 > 
 > On 16/07/2024 05:37, WangYuli wrote: 
 > > GitHub Dependabot has issued the following alert: 
 > > 
 > > "Upgrade setuptools to version 70.0.0 or later. 
 > > 
 > >   A vulnerability in the package_index module of pypa/setuptools 
 > >   versions up to 69.1.1 allows for remote code execution via its 
 > >   download functions. These functions, which are used to download 
 > >   packages from URLs provided by users or retrieved from package 
 > >   index servers, are susceptible to code injection. If these 
 > >   functions are exposed to user-controlled inputs, such as package 
 > >   URLs, they can execute arbitrary commands on the system. The 
 > >   issue is fixed in version 70.0. 
 > > 
 > >   Severity: 8.8 / 10 (High) 
 > >   Attack vector:        Network 
 > >   Attack complexity:        Low 
 > >   Privileges required:     None 
 > >   User interaction:    Required 
 > >   Scope:              Unchanged 
 > >   Confidentiality:         High 
 > >   Integrity:               High 
 > >   Availability:            High 
 > >   CVE ID:         CVE-2024-6345" 
 > > 
 > > To avoid disturbing everyone with the kernel repo hosted on GitHub, 
 > > I suggest we upgrade our python dependencies once again to appease 
 > > GitHub Dependabot. 
 > > 
 > > Link: https://github.com/dependabot 
 > > Signed-off-by: WangYuli wangyuli@uniontech.com> 
 >  
 > Acked-by: Helen Koike helen.koike@collabora.com> 
 >  
 > Thanks 
 > Helen 

Applied to drm-ci-next.

Thanks
Helen

 >  
 > > --- 
 > >   drivers/gpu/drm/ci/xfails/requirements.txt | 2 +- 
 > >   1 file changed, 1 insertion(+), 1 deletion(-) 
 > > 
 > > diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt 
 > > index e9994c9db799..5e6d48d98e4e 100644 
 > > --- a/drivers/gpu/drm/ci/xfails/requirements.txt 
 > > +++ b/drivers/gpu/drm/ci/xfails/requirements.txt 
 > > @@ -11,7 +11,7 @@ requests==2.31.0 
 > >   requests-toolbelt==1.0.0 
 > >   ruamel.yaml==0.17.32 
 > >   ruamel.yaml.clib==0.2.7 
 > > -setuptools==68.0.0 
 > > +setuptools==70.0.0 
 > >   tenacity==8.2.3 
 > >   urllib3==2.0.7 
 > >   wheel==0.41.1 
 >  
 > 
