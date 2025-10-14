Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF9BD70BF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 04:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FF210E168;
	Tue, 14 Oct 2025 02:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="WeBI0vkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A471C10E04A;
 Tue, 14 Oct 2025 02:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=O8tSlwYSwiGvVUADIEDaKn+4vBUhFkBX7mtHOLFiN50=; b=WeBI0vkB79ISkxUoRIxjPgAOhh
 B2ckJZPmdOn59q2ZJwi//Pe4FJVqP8zrlasd9Lk9S3sRUjrmB666XZX0X8S9+ouTZBmeO/6CUqlkS
 1/io6yyeLPbdiZaXDyzvz7Ub0ww/nL5MtcDPkm/i6jLJoA9S4S6MJo5/uPCMAs1YqoHUmb5EO9bPT
 kMsAV+K/yMOYY5bX+VbR+G2W8/sDmoDeKjg+qBFTHwfMk8IBJE4q4evQ4pFVS1DhTyvDljHxMO5Cy
 uYoQJISfdgCi4QW2q4F2hdshYmOFVqvhzK2Pl4op4KgrSuiCEQVM+AF4Oz7nUxT+w+unCyWiIWenb
 XaHse0+g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v8USz-0000000Ex9i-26xH; Tue, 14 Oct 2025 02:08:45 +0000
Message-ID: <a9226ec9-d98b-49ea-a589-c1c2880cfbfb@infradead.org>
Date: Mon, 13 Oct 2025 19:08:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: xe_guc_pc.c: fix DOC underlines
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251013182827.733781-1-rdunlap@infradead.org>
 <aO1aCNMPKTNZta4V@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aO1aCNMPKTNZta4V@intel.com>
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

Hi,

On 10/13/25 12:59 PM, Rodrigo Vivi wrote:
> On Mon, Oct 13, 2025 at 11:28:26AM -0700, Randy Dunlap wrote:
>> Apparently a recent change in docutils has made checking of section
>> heading levels (underline style) be more careful.
>>
>> There are 2 heading underline style errors reported here. Repair them by
>> changing the underline style from Chapter (using '=') to Section (using
>> '-') since they are used within a Chapter already (in xe_firmware.rst).
>>
>> """
>> Documentation/gpu/xe/xe_firmware.rst:31: drivers/gpu/drm/xe/xe_guc_pc.c:75: ERROR: A level 2 section cannot be used here.
>>
>> Frequency management:
>> =====================
>>
>> Established title styles: =/= =
>>
>> The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
>> One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
>> (up to Docutils 0.21, these sections were silently dropped). [docutils]
>> Documentation/gpu/xe/xe_firmware:31: ../drivers/gpu/drm/xe/xe_guc_pc.c:86: ERROR: A level 2 section cannot be used here.
>>
>> Render-C States:
>> ================
>>
>> Established title styles: =/= =
>>
>> The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
>> One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
>> (up to Docutils 0.21, these sections were silently dropped). [docutils]
> 
> Nothing against this change, but I'd like to understand more on what has
> actually changed. I have docutils 0.21.2 here and I cannot see this error.
> 

Hm, I now have Docutils 0.22.2 and I also cannot reproduce this issue.

> Perhaps it was a temporary bug in docutils 0.21.0 or 0.21.1 ?

Yes, maybe.

I suggest that we drop this patch.
Thanks for your assistance.
-- 
~Randy

