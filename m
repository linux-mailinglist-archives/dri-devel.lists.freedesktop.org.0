Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D030B9A5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F14A6E8F7;
	Tue,  2 Feb 2021 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F8046E301;
 Mon,  1 Feb 2021 09:59:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 346E0101E;
 Mon,  1 Feb 2021 01:59:26 -0800 (PST)
Received: from [10.57.8.191] (unknown [10.57.8.191])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55D163F718;
 Mon,  1 Feb 2021 01:59:24 -0800 (PST)
Subject: Re: [PATCH v2] drm/lima: add governor data with pre-defined thresholds
To: Qiang Yu <yuq825@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>
References: <20210127194047.21462-1-christianshewitt@gmail.com>
 <CAKGbVbtaDHmukvfF=sfSmWHVdAYoF6-i4RTzsPQ6zfsjHcGNCw@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <2c8d2b9e-c1cc-1157-19de-409957ecf9da@arm.com>
Date: Mon, 1 Feb 2021 09:59:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKGbVbtaDHmukvfF=sfSmWHVdAYoF6-i4RTzsPQ6zfsjHcGNCw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/30/21 1:57 PM, Qiang Yu wrote:
> This patch gets minor improvement on glmark2 (160->162).

It has bigger impact when the load is changing and the frequency
is stuck to min w/o this patch.

> 
> Seems there's no way for user to change this value, do we?
> Or there's work pending to expose it to sysfs?

True there is no user sysfs. I've proposed a patch to export these via
sysfs. Chanwoo is going to work on it. When it will land mainline, it's
probably a few months. So for now, the fix makes sense.

Regards,
Lukasz

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
