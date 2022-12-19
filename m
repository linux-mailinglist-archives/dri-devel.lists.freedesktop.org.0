Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8590651F14
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA6C10E394;
	Tue, 20 Dec 2022 10:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FC910E002
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 15:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671464054; cv=none; d=zohomail.in; s=zohoarc; 
 b=WXVL5pept0wyAvliElBj4DiD7BB/uHTKTkVP79BIgnfedfw4lABN4ua6dRuTrPCo1fNcTt0QL1ccVRwxeugamxgDjTKRjTneprMjfnAcqB9CcOWC9wz+knkuX00A6S3tqAwDMwEs7CMTzCzJNGoRJ+R8X21DxWvvEGQRryj/THc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671464054;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=O8NG+C2lB2shkfoX7DpHMnoUOQ+RibmnP1poMGg5OA4=; 
 b=d+PHIfs6Tm5CYQSF7k0Da8ZTQ6KR9et4TVQ9CORNtM3VcYKgCo0TxkMsl1er4bFZBbTI8mxu+WlAeMwzEoii+If3uF6ELV6Qe05DFMJQU4oIn+MQhdvYdI1Lg5fFIN7GBBhMrIcQkTIqQ8VMchNaBlfcvQ04ravbKHgsHqMXxvA=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671464054; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=O8NG+C2lB2shkfoX7DpHMnoUOQ+RibmnP1poMGg5OA4=;
 b=XJJC4Hl46YEmDPGK8kxrt0TgcCARxCBLIf22/nKqBIkxEjfaNNplODVsWqF2/y42
 CuvpnxtHyzwjlixIhRhe2bRxWYZyWejaU7RVOICet3iiMJYXodkmZT2eenrmgB/xf9B
 56GX1kzadrDlQntFbpg1cF5y3olGm3QAZHEWhL4w=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1671464042539690.9187061987653;
 Mon, 19 Dec 2022 21:04:02 +0530 (IST)
Date: Mon, 19 Dec 2022 21:04:02 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Message-ID: <1852b054022.16e87c6b116450.6116081892972417758@siddh.me>
In-Reply-To: <0693327a-4951-6864-12c6-88cfe81abd12@suse.de>
References: <20221219142319.79827-1-code@siddh.me>
 <0693327a-4951-6864-12c6-88cfe81abd12@suse.de>
Subject: Re: [PATCH] drm: Replace DRM_INFO() with pr_info()
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Dec 2022 20:27:45 +0530, Thomas Zimmermann wrote:
> Hi
> 
> Am 19.12.22 um 15:23 schrieb Siddh Raman Pant:
> > Line 536 of drm_print.h says DRM_INFO() is deprecated
> > in favor of pr_info().
> 
> That's a misleading comment. DRM_INFO() is deprecated for drm_info(). 
> pr_info() et al is only to be used of you don't have a dev pointer.
> 
> Best regards
> Thomas

Maybe you are confusing it with DRM_DEV_INFO? It takes the dev pointer,
and is indeed told to be deprecated in favour of drm_info() in the
comments (see line 394).

DRM_INFO is a separate macro for printing stuff, and does not take the
dev pointer. They seem to be early wrappers for printk, I guess when
pr_info did not exist. And all they do different from pr_info is to add
DRM_NAME (which seems to be just "drm") in front of the string.

Thanks,
Siddh
