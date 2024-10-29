Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ACF9B4703
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 11:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828DB10E616;
	Tue, 29 Oct 2024 10:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="NrIlgmI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEA510E616
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 10:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730198255; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W2ehznKhZDjYLGdDx38cfD79903b/kCP59/EGgrZx0m9KcjtP+vLC0nCSnDDgyoPt3vT5pPir/8lVwItEmWuiROris3Q9WFvwbxMrNpuh27Ch09+caO9QZAyW8AQeWiZWeO70nQMirW8yKEldlonmA75E7ERM0TVYdrqzJKplAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730198255;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=LNMy/MmJuQOJdLUAUIHy+ZV0WQSxzJ0h2MDmigRTDqo=; 
 b=AX73lXN/KE8GkPOewfoJ8RjYw/0aLqZlxwP8Iyhd3r/55URU16kVTvAJFDKknfjjDw9uukAXEk3TTq6JUomhhsa6KRIpa+dG8c9CWvcekuT1BCF5PqlL7RbzR6Qmwz7K3XXe20smoA1CNBRP/Xb9jARr6+k0FqAdRuQ4Kuw07B0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730198255; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=LNMy/MmJuQOJdLUAUIHy+ZV0WQSxzJ0h2MDmigRTDqo=;
 b=NrIlgmI+4M88tTfkK0dtz6srMU9kOvI/rEDwjJlWiRjeeXuJvrmT80dFGewHSA+z
 3qg3LnD+uEtcoNxuhN9O20FYJ3Psssr7u6a4NR66grcoH4G6aO2kbNh9uwbcz90Hh2R
 Mi3zstzZbv86avx7mD3yeO8uZ9bFktrCC+txYsZQ=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1730198253399319.6794373787027;
 Tue, 29 Oct 2024 03:37:33 -0700 (PDT)
Date: Tue, 29 Oct 2024 07:37:33 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "WangYuli" <wangyuli@uniontech.com>
Cc: "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 "mripard" <mripard@kernel.org>, "tzimmermann" <tzimmermann@suse.de>,
 "airlied" <airlied@gmail.com>, "simona" <simona@ffwll.ch>,
 "david.heidelberg" <david.heidelberg@collabora.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "guanwentao" <guanwentao@uniontech.com>, "zhanjun" <zhanjun@uniontech.com>,
 "Vignesh Raman" <vignesh.raman@collabora.com>
Message-ID: <192d7da2f2a.1069aaa001047791.5583301334791429946@collabora.com>
In-Reply-To: <11312D359DDCA3CF+20241017034004.113456-1-wangyuli@uniontech.com>
References: <11312D359DDCA3CF+20241017034004.113456-1-wangyuli@uniontech.com>
Subject: Re: [RESEND. PATCH 1/5] drm/ci: Upgrade requirements because of
 bothering by GitHub Dependabot
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





---- On Thu, 17 Oct 2024 00:39:48 -0300 WangYuli  wrote ---

 > GitHub Dependabot keeps bugging us about old, vulnerable Python packages. 
 >  
 > Until we figure out a way to make it calm, we're stuck updating our 
 > dependencies whenever it complains. 
 >  
 > I guess it's a good thing in the long run, though, right? 
 > Makes our CI a bit "more secure"... 
 >  
 > Signed-off-by: WangYuli wangyuli@uniontech.com> 
 > -- 
 > 2.45.2 
 >  
 > 


Hi WangYuli,

Thanks for this.

tbh, I'm tempted in removing the python script that is in the repo, and keep it out-of-tree somewhere, since it is a tool that is only triggered manually in local environment.

I also want to hear Vignesh's thoughts about it.

Thanks
Helen
