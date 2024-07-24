Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530693B2C6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 16:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8466B10E13C;
	Wed, 24 Jul 2024 14:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1976610E13C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 14:35:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16F73106F;
 Wed, 24 Jul 2024 07:36:10 -0700 (PDT)
Received: from [10.57.44.253] (unknown [10.57.44.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B2E63F5A1;
 Wed, 24 Jul 2024 07:35:41 -0700 (PDT)
Message-ID: <bba61792-a098-4ce0-81c4-e73b7dda3b79@arm.com>
Date: Wed, 24 Jul 2024 15:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Asahi Lina <lina@asahilina.net>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, David Airlie <airlied@gmail.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
 <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
 <CAL_Jsq+Dr5zO5MKEGq0dW9SuTuawaJMhHziFd73Ef_S1zbOkXw@mail.gmail.com>
 <6b60a83d-8416-4cf8-b373-dc3c697c788a@arm.com>
 <1CF0978E-344C-4EC9-A221-4F19EBA4B988@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <1CF0978E-344C-4EC9-A221-4F19EBA4B988@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 24/07/2024 15:27, Daniel Almeida wrote:
> Hi Steven!
> 
>> On 24 Jul 2024, at 10:54, Steven Price <steven.price@arm.com> wrote:
>>
>> [1] Although I have to admit for a debugging feature like devcoredump
>> there might well be pressure to implement this in C as well purely so
>> that customer issues can be debugged…
> 
> FYI: I picked devcoredump because it was self-contained enough that I
> could make a proof-of-concept and get the discussion started. I think
> that, at least from this point of view, it has been successful, even if we
> decide against a partial Rust driver! :)

Indeed, thanks for posting this! It's provoked a good discussion.

> I was informed early on that delaying a debugging feature until the
> abstractions were merged would be a problem. Don’t worry: I can rewrite
> the kernel part in C, that would indeed be a very small patch. 

I'll leave that for you to decide. There's definitely nothing blocking a
patch like this in C, but equally I'm not aware of anyone desperate for
this support yet.

Thanks,

Steve

