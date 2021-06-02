Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA7398510
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED106EC14;
	Wed,  2 Jun 2021 09:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4770F6EC13;
 Wed,  2 Jun 2021 09:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 6768A3F503;
 Wed,  2 Jun 2021 11:16:09 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="U+8r61NS";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.717
X-Spam-Level: 
X-Spam-Status: No, score=-2.717 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id su0KoBf9jvId; Wed,  2 Jun 2021 11:16:04 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id B0F8D3F4B6;
 Wed,  2 Jun 2021 11:16:02 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2909A36012A;
 Wed,  2 Jun 2021 11:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622625362; bh=4hCp9bO61tPGQrNvB6R+ZrLQJBkFZAEhg82TnCH31/U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U+8r61NSU4bkHQBy9R/k9D7YZeBOoycOa0MKvjhL4DIoMK5uuaxZTZX3LV6QsiEZB
 Bb5pHmwbPEzHry0tsHT2Uj0TNHuVDLD9g/SuFeOksExVULzJUhMGxGxcbhWIQe5fA0
 MgpexLpM9xO9m2rKD7wz2/IgemRwAuOy173km1FU=
Subject: Re: Merging TTM branches through the Intel tree?
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
Date: Wed, 2 Jun 2021 11:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/2/21 10:32 AM, Christian König wrote:
> Uff I'm just waiting for feedback from Philip to merge a large patch 
> set for TTM through drm-misc-next.
>
> I'm pretty sure we will run into merge conflicts if you try to push 
> your changes through the Intel tree.
>
> Christian.

OK, so what would be the best approach here?, Adding the TTM patches to 
drm-misc-next when your set has landed?

Thanks,

Thomas

