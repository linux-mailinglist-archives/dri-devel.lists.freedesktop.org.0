Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9582AF6EC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 17:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7741289F53;
	Wed, 11 Nov 2020 16:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C6689F53
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 16:52:01 +0000 (UTC)
Date: Wed, 11 Nov 2020 16:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605113518;
 bh=I7Oj+O9pcwqgWn+7iAaevjBA2rqVliq4jeV0HFRSQ8g=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=c1vuxHA3ytJJijIGaxSavlgF9+RQPEU4mu/YfJwg2lW9/QXaHVsV1wb3WupCl2XPS
 2WaG1YUKftSPwT5prJwKzQz8I5sQ5WHDhT09/6U+81KpvBW3dmDk47eXQCSnTgS0iH
 E8c/PKPT/8GNwOgyVCe2sHvD4SO7XsD4IayETBZkmMjAss64aKC3NvwISFFfEmj11d
 3cMg0poKv2YfXxs9zVonWJQZpbu0pdbYZiB+VRcpQ0fHJ1iO6ToyebaVJchbQKjjGd
 9WkUz9AIg7fVMYDIboz5ofAwef6Pe6coLGirdhB9z85ElxPI7voHxJaMRf014DEbnR
 KryqyVezdgIoA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 2/2] drm: add debug logs for drm_mode_atomic_ioctl
 errors
Message-ID: <pHYJSRYai0UsSbp5GjA7LIGIcM-T_se4YV4xDv-D8PxZ6vM601sVdJOJEdXDvzeb_J_UzAFRix2BR4pXPTRIIE_42j5ZmSUTnfZcORLNlJw=@emersion.fr>
In-Reply-To: <20201111164853.GQ401619@phenom.ffwll.local>
References: <AVFi5ZzKwRVLtY8AQyxvqgIbcUfVgNebOtGVwSNMKvs@cp4-web-038.plabs.ch>
 <20201111164853.GQ401619@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, November 11, 2020 5:48 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> Submission bikeshed: Patch 1&2 aren't threaded. I thought git send-email
> gets that right by default nowadays ...

Yeah, it's a bug in my SMTP server I haven't bothered to write a patch
for yet. Sorry about that.

> Anyway, on both patches: Reviewed-by: Daniel Vetter daniel.vetter@ffwll.ch

Thanks for the review!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
