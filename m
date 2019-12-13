Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6550C11E693
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEA16E083;
	Fri, 13 Dec 2019 15:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80A3C6E083
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:31:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC54A1476;
 Fri, 13 Dec 2019 07:31:51 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E02DE3F52E;
 Fri, 13 Dec 2019 07:31:50 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Prefix interrupt handlers' names
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20191213123942.22891-1-ezequiel@collabora.com>
 <26b59d91-f974-de29-5ca8-6fbc2db29a11@baylibre.com>
 <31fd8f77-99b3-9edf-a23b-1484d9dcf48f@arm.com> <20191213143225.GB3640@kevin>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b44f31b3-ff81-1b41-e25c-cb424f990606@arm.com>
Date: Fri, 13 Dec 2019 15:31:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191213143225.GB3640@kevin>
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2019 2:32 pm, Alyssa Rosenzweig wrote:
>> TBH it would probably be sufficient to save the bother of allocating
>> strings and just settle on "panfrost-{gpu,job,mmu}", since upstream
>> users are unlikely to ever come across a system with more than one
>> Mali in it ;)
> 
> Agreed.
> 
> ----Wait, you said *upstream*? Are there .... oh no

Heh, fear not - I'm only thinking of the "Juno board with FPGA 
prototyping stack" setup, and the people using those in anger are all 
working on some other driver anyway ;)

Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
