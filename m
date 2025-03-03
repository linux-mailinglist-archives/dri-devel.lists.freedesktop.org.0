Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5DA4CA98
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 19:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC7710E28D;
	Mon,  3 Mar 2025 18:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="O2J12IMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A149410E28D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 18:00:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741024809; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jc8yJLnnw3/licG75aO2k3F7+R2qGKnOXgsmDpbWQO3T1aUG7U+U74BnG1TUTq9jjFHk79hW/gvKzTaTNgK8/7I3moW4PFnH4V1moOpBNUUk0J7iBo+FvsNtnwusMxDJRW+xnkMe+aoJBHHJjAbf/PN4F/4l5wON1FkwycMJOmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741024809;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=Z/FwdtTXq18wZffN/PhVu0JBqufMskZbU2ZZXRcfFP8=; 
 b=kvA86wlr77SwIctQ2008V9ENoz5ZXivEfxqSwxK4SgoaqGnIfyJa0hovy2SHE3Kaqr9/T4iAR2V3hxYwuJq/rRED/uZIwXPdfTDU53L3H9blDK+n3xTC+wliLamcAcXHZLw6OSIlSCnBOHyl9KGbbgcA4pP9KGpBsy2s1OREBoo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741024809; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=Z/FwdtTXq18wZffN/PhVu0JBqufMskZbU2ZZXRcfFP8=;
 b=O2J12IMsecctdWjCMaFBjzVIqMYOm6zdWDRtNjF1elBkJizfmKh7rTQwltlYpFvb
 ZteOYNWFSC4obP+KLMj5j6KR8NKwe/TFEZQN5jh6US/BZrcJDiV4VDeIq3xFWG6qk2D
 EW8fa4AWQ+R3hquUaZbAU6ULD/v+v6kfOdlYU07Y=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1741024806947554.5249012316598;
 Mon, 3 Mar 2025 10:00:06 -0800 (PST)
Date: Mon, 03 Mar 2025 18:00:06 +0000
From: Ashley Smith <ashley.smith@collabora.com>
To: "dri-devel" <dri-devel@lists.freedesktop.org>
Message-ID: <1955d2a4808.c0483b872158199.4704203031354961686@collabora.com>
In-Reply-To: <f82b0996-77ea-4b1e-81c5-c3c8a48b4f95@arm.com>
References: <20250303151840.3669656-1-ashley.smith@collabora.com>
 <f82b0996-77ea-4b1e-81c5-c3c8a48b4f95@arm.com>
Subject: Re: [PATCH] drm/panthor: Update CS_STATUS_ defines to correct values
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

> Please don't reference a URL which isn't accessible to 'normal' people
> ;) Something like...
>
> as documented in the G610 "Odin" GPU specification
> (CS_STATUS_BLOCKED_REASON register)
>
> ...would hopefully be enough to find the relevant documentation for
> those of us that have it.

You are correct, apologies for that! I will send a v2 with the renamed _RES as you correctly mentioned it isn't used yet.

> You might also want:
>
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")

I will add this also.

Thanks,
Ash
