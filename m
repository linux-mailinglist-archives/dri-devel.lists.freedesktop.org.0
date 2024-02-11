Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B818507F7
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 07:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F54F10E652;
	Sun, 11 Feb 2024 06:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="jhMFIIBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB6C10E652
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 06:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=RPcJqvwoST9wCChzzsCBxIVXoZ9qVjJGW0thxxVGU24=; b=jhMFIIBl2+57ndStopF11nK6ph
 AZhhirXdSv55y/phEJ2JyHldUqToS/iX0JnFsx6yToz8aEG/M/zzx9Me84Qx2NbyJtuYSv3fR1YKO
 2SHtHFUuOKnrivY26cdMvtDQSgjwmpJbTMf7yoTKNUUQRNfnydPm08Apahxc0ZnFh0ET1bWuWurB7
 TzolSD9VllNwzro6tZB6QRG3quHQJ76LZ26zhfcHanCow4hBv4UYtjXCOcD/CXjEhH+Ni52ZXI6WE
 LSpmU18RfBF1kBh65lrwalHK+gUKib/TtnJp8Pl8EONTobbf3CeAAG493fGP8ucUi57/OFLEoeYaF
 YYxO1SyQ==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rZ3ez-00000002Q23-2E3b; Sun, 11 Feb 2024 06:49:53 +0000
Message-ID: <7b17f021-cff8-4110-ac8f-c8f635263293@infradead.org>
Date: Sat, 10 Feb 2024 22:49:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm: display: indent fix in comment
Content-Language: en-US
To: Kousik Sanagavarapu <five231003@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240124183659.511731-1-five231003@gmail.com>
 <ZcTxUDb3_Xtqk8uW@five231003>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZcTxUDb3_Xtqk8uW@five231003>
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



On 2/8/24 07:20, Kousik Sanagavarapu wrote:
> On Thu, Jan 25, 2024 at 12:05:56AM +0530, Kousik Sanagavarapu wrote:
>> The comments explaining the function "drm_dp_mst_atom_check_mgr()" had
>> uneven indentation which made "make htmldocs" complain:
>>
>> 	Documentation/gpu/drm-kms-helpers:296:
>> 	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5496:
>> 	ERROR: Unexpected indentation.
>>
>> 	Documentation/gpu/drm-kms-helpers:296:
>> 	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5500:
>> 	WARNING: Block quote ends without a blank line; unexpected unindent.
>>
>> Fix this by getting the indent right.
>>
>> Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
>> -- 
> 
> Ping again.
> 
> Thanks

Hi,
This seems to be fixed by commit 1a84c213146a.

If you don't agree, please explain.
Thanks.

-- 
#Randy
