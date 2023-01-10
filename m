Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E0664C10
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 20:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFF110E491;
	Tue, 10 Jan 2023 19:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7F710E64F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 19:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1673377902; cv=none; d=zohomail.in; s=zohoarc; 
 b=bF1xE5FDoH7Jt/Ak6iIGzZTLM48ugq7uBJEWLMTkfAh/eLbMYQH2RXcWFDPY+VXVHQK8kAF+/FhdKgjB8bbZyVum6BN+A/yIu6CoPXTyr4+UhxxEYc4EPb3uINQjpFIqzbc/XLvVwss3iMLgzqNzAviPNaS7KWiNB7l1+KIOVT4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1673377902;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=O+Xx6AH9eZ1dSlEhacGjCX8gd4rXEbBE5hUVfekqav0=; 
 b=Hm4YuVz6EOnwfrTUcYmeUgaWlmchKiZ6H2wu6RnkFiL4SyuWxd8zgV4AFfylxaJvMZHtL52k2xRoeSzr/45E6TTN0h/Q/8h+1pCWTWwQva05AkflCCbArjEmxZCu1TFil70BavpsCvPkgAs+d147YG/qvM5VCAOO4Ya4Tws/A1c=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673377902; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=O+Xx6AH9eZ1dSlEhacGjCX8gd4rXEbBE5hUVfekqav0=;
 b=VkMiJ9aF2jpNeeCbOVR6li2BaHXfw523DOa5j0iCTukZ4F3RkpTG1L3rje4CdXWr
 um5sAIKaDOJZIqVE3gpcy56KmLAU2vNnm9nmOIBCNF0judz2WXMwcLMtEuML25zsqNv
 Lf9n1ilXnKEZIia/EQoQEeM4k6Lu+jAsTS/kqg8s=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1673377890224944.9758733104535;
 Wed, 11 Jan 2023 00:41:30 +0530 (IST)
Date: Wed, 11 Jan 2023 00:41:30 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Simon Ser" <contact@emersion.fr>
Message-ID: <1859d183fa6.859b5b89421607.8806421513207042042@siddh.me>
In-Reply-To: <C6RlXueyDNu9t4z9O_S7mx1gZbmzjCcHqbarn7w6QZcNVuBLUAKwyzGZQXk2dIQSxcauzlHqtkFwPveNglu8ZDtU875E7X4pS9zQsYyfMPA=@emersion.fr>
References: <cover.1673269059.git.code@siddh.me>
 <C6RlXueyDNu9t4z9O_S7mx1gZbmzjCcHqbarn7w6QZcNVuBLUAKwyzGZQXk2dIQSxcauzlHqtkFwPveNglu8ZDtU875E7X4pS9zQsYyfMPA=@emersion.fr>
Subject: Re: [PATCH v6 00/10] drm: Remove usage of deprecated DRM_* macros
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
Cc: thomas zimmermann <tzimmermann@suse.de>, sam ravnborg <sam@ravnborg.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 Jan 2023 20:45:54 +0530, Simon Ser wrote:
> I pushed the last 3 patches to drm-misc-next.
  
Thank you!
