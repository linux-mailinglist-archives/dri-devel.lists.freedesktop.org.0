Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC075AE369C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 09:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21D510E19F;
	Mon, 23 Jun 2025 07:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D866F10E199;
 Mon, 23 Jun 2025 07:20:39 +0000 (UTC)
Message-ID: <b1e5078a-e458-436a-ba95-2ef569d177d3@lankhorst.se>
Date: Mon, 23 Jun 2025 09:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe: Start using ggtt->start in preparation of
 balloon removal
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250610070241.875636-1-dev@lankhorst.se>
 <20250610070241.875636-3-dev@lankhorst.se>
 <efdc197c6d613b15ff7e54a0aed8e1772edc361a.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <efdc197c6d613b15ff7e54a0aed8e1772edc361a.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
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

On 2025-06-11 20:53, Summers, Stuart wrote:
> On Tue, 2025-06-10 at 09:02 +0200, Maarten Lankhorst wrote:
>> Instead of having ggtt->size point to the end of ggtt, have ggtt-
>>> size
>> be the actual size of the GGTT, and introduce ggtt->start to point to
>> the beginning of GGTT.
>>
>> This will allow a massive cleanup of GGTT in case of SRIOV-VF.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
> I agree this is way better. Thanks for the patch!

Can I extend your r-b to the entire series?

Kind regards,

~Maarten

