Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABBB23B4E5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 08:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0316E426;
	Tue,  4 Aug 2020 06:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EA96E426;
 Tue,  4 Aug 2020 06:14:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8F2CAEFE;
 Tue,  4 Aug 2020 06:14:22 +0000 (UTC)
Subject: Re: [PATCH 4/6] xen: Sync up with the canonical protocol definition
 in Xen
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-5-andr2000@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <90b215cb-c878-340e-402a-7739ba17e4a7@suse.com>
Date: Tue, 4 Aug 2020 08:14:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731125109.18666-5-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.07.20 14:51, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This is the sync up with the canonical definition of the
> display protocol in Xen.
> 
> 1. Add protocol version as an integer
> 
> Version string, which is in fact an integer, is hard to handle in the
> code that supports different protocol versions. To simplify that
> also add the version as an integer.
> 
> 2. Pass buffer offset with XENDISPL_OP_DBUF_CREATE
> 
> There are cases when display data buffer is created with non-zero
> offset to the data start. Handle such cases and provide that offset
> while creating a display buffer.
> 
> 3. Add XENDISPL_OP_GET_EDID command
> 
> Add an optional request for reading Extended Display Identification
> Data (EDID) structure which allows better configuration of the
> display connectors over the configuration set in XenStore.
> With this change connectors may have multiple resolutions defined
> with respect to detailed timing definitions and additional properties
> normally provided by displays.
> 
> If this request is not supported by the backend then visible area
> is defined by the relevant XenStore's "resolution" property.
> 
> If backend provides extended display identification data (EDID) with
> XENDISPL_OP_GET_EDID request then EDID values must take precedence
> over the resolutions defined in XenStore.
> 
> 4. Bump protocol version to 2.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
