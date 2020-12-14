Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62622D9AAD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6AD89C85;
	Mon, 14 Dec 2020 15:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1DE6E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:16:47 +0000 (UTC)
Date: Mon, 14 Dec 2020 10:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607959007;
 bh=7DxumA/ic+kumc6ZLIwtVEMav+wzV5ZcKzAQRwtusEc=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=q7nMV1CyVP9j8gaJIkuSReysJTiVYNArDkOpi/nKAZQ+AdVDFyVtPsifGG3RIqG5R
 XH72esxCzGcFwcxEJZN+/Uoni3hcoAptCxLugqwM1hAQNB4YxXMvnrYnRI9NfT0E2s
 QnrXPbgQljc2HkMtByGHtFqTxkCw4S7pHmezVEBFXAMw/D1fS7F1OeXIIR9jXZbpsu
 WWJ6CeIZaeK1Oj3HwaP0roscAhXapzwNDozyqxwgFXGF2GgA1tH5Y5iw2w+OGMm30t
 vylINlj5nYvxosPJxIWnq7WVglPJX2uEGTpak/Mq4F1pWymkFhNw90BCr3lVNljBtX
 KRmX56BDxLzjA==
From: Sasha Levin <sashal@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH AUTOSEL 4.14 2/8] drm/nouveau: make sure ret is
 initialized in nouveau_ttm_io_mem_reserve
Message-ID: <20201214151646.GT643756@sasha-vm>
References: <20201212160859.2335412-1-sashal@kernel.org>
 <20201212160859.2335412-2-sashal@kernel.org>
 <642b5479-d4d9-37a7-3b14-3162374829d5@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <642b5479-d4d9-37a7-3b14-3162374829d5@amd.com>
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
Cc: Mark Hounschell <markh@compro.net>, Karol Herbst <kherbst@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 10:49:55AM +0100, Christian K=F6nig wrote:
>Hi Sasha,
>
>please don't apply this patch to any older kernel.
>
>The fix was only needed for a patch which went in with the 5.10 pull =

>request.

I'll drop it, thanks!

-- =

Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
