Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE7950D91
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 22:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC9710E2CF;
	Tue, 13 Aug 2024 20:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="am7s8RDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2640210E2CF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 20:06:10 +0000 (UTC)
Delivered-To: vignesh.raman@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723579567; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ONA+Dn/+VKgTnBa2REUHtNDBSRiJp/n5ZA2OUyvELanaiSdXYjUsm7WJPbnm5n2xNbr/ev9BaETrvr5xd5w8mL6WTi4kIS7+jNdRXMOLaHKBA1Fv0nu0C8GxXiQ0U4tqNnbVfeM12Io6ILYKjJaIteLYzfXgEUIJfNe+rV0HBe0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723579567;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4kgDpvw/qRDvAuTJMC6kdFG5fzn7p6L34o5jQat7XV0=; 
 b=mQbA50wIo226KWk/ovdaZ/IT122d5pDo8EnrcJ3eSGwaKsaFZltxD1EMXilZWDOzp7rtERBDTV18q9Kdmlf2mDZNsOJuLAFiNEFWvROwIHqzXsKbuE4gweqql/mSekrT2QyeGzgJRlu9k2dXl1FnbtrvnizuksI0g6TJ5XyPhJI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723579567; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4kgDpvw/qRDvAuTJMC6kdFG5fzn7p6L34o5jQat7XV0=;
 b=am7s8RDE0ij43aAYMZsBpF6mFSYV/BJBBSxFR535LMdeGLI86cKT2NwomYru0Ve7
 V5B59hPlzvhaEQqbvCxhhA5YuKb9/h+AJyh3MBVCOFxWbcm8j0y80qA1CdoAg7Wn30s
 zEyulYl9TySqFrP+kBht0665Uvx2BrYMoQ8QNG44=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1723579566707428.10798840074915;
 Tue, 13 Aug 2024 13:06:06 -0700 (PDT)
Date: Tue, 13 Aug 2024 17:06:06 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Daniel Stone" <daniel@fooishbar.org>
Cc: "Vignesh Raman" <vignesh.raman@collabora.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1914d590a61.110918b2f913118.3115650497780570443@collabora.com>
In-Reply-To: <CAPj87rNO4ckvgggn=FE4odpAsGDb95XZ7py0GrguJqB0Y0TN8g@mail.gmail.com>
References: <20240807082020.429434-1-vignesh.raman@collabora.com>
 <CAPj87rNO4ckvgggn=FE4odpAsGDb95XZ7py0GrguJqB0Y0TN8g@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: uprev mesa
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





---- On Wed, 07 Aug 2024 09:33:10 -0300 Daniel Stone  wrote ---

 > On Wed, 7 Aug 2024 at 09:21, Vignesh Raman vignesh.raman@collabora.com> wrote: 
 > > Uprev mesa to adapt to the latest changes in mesa ci. 
 > > Project 'anholt/deqp-runner' was moved to 'mesa/deqp-runner'. 
 > > So update the link. 
 >  
 > Reviewed-by: Daniel Stone daniels@collabora.com> 
 > 

Applied to drm-misc-next

Thanks
