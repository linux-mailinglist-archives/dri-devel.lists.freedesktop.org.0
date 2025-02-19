Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D5A3B512
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 09:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E6F10E48D;
	Wed, 19 Feb 2025 08:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3FF10E48D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 08:53:28 +0000 (UTC)
Message-ID: <5d692735-de55-4ec7-9988-ae360685f7d4@lankhorst.se>
Date: Wed, 19 Feb 2025 09:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cgroup/dmem: Don't open-code
 css_for_each_descendant_pre
To: Tejun Heo <tj@kernel.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <20250127152754.21325-1-friedrich.vock@gmx.de>
 <7f799ba1-3776-49bd-8a53-dc409ef2afe3@lankhorst.se>
 <Z7TT_lFL6hu__NP-@slm.duckdns.org>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <Z7TT_lFL6hu__NP-@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hey,

On 2025-02-18 19:39, Tejun Heo wrote:
> Hello,
> 
> On Tue, Feb 18, 2025 at 03:55:43PM +0100, Maarten Lankhorst wrote:
>> Should this fix go through the cgroup tree?
> 
> I haven't been routing any dmem patches. Might as well stick to drm tree?

Thanks, I've pushed the fix to drm-misc-fixes. It should likely enter 
v6.14-rc4, otherwise rc5. :)

Cheers,
~Maarten
