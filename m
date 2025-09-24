Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D5B9C337
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 22:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E5C10E7ED;
	Wed, 24 Sep 2025 20:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="joZ0LwVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 510 seconds by postgrey-1.36 at gabe;
 Wed, 24 Sep 2025 20:53:32 UTC
Received: from bout4.ijzerbout.nl (bout4.ijzerbout.nl [91.99.166.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0E410E7ED
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1758746701; bh=+W9ee6NkoaXu3UcDGl9X8Whovz/tJ6aDiwbXXN2aka0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=joZ0LwVVLYjhdo19MSoDs/C/K0gdffRoiPl49ISJwu1BeZ2oVNlBtdxDuAUwEVsAn
 M9l8iaNabpKZ8o+M8rZGFXtuXwBZuULvBBvCrdhM2bX/rJ4WXasaT09OboJiHud2K4
 S/40QARHuhd1Mw4cmUOaf7ZV3Lg3lmmdDZob6tS+yC3gk3Cz79p4DHcchgk/PCQAGl
 jxvY3mGkqrl1Dq/oUSxm3lI5NsPRRGhYLEDQtyvYPumGPRC+lrYCXBK9zhDgSQRadz
 NdCtr31sx8TrRL06/pO8wQxDoZxbUKzVv72jvIXuKs5IgrOULGPpZ0q3jOeXGGQERM
 qXsYyMzCJ0ikLMBRRowz6KnorOysdO13LzmW03TXoc4ex4GTZCaXSqRAh/TqR+080B
 0yZuziIqlHif2YndSsSCRTqripyDJZDMDsKaEAyWqxT7XQp9yteMb0CI0zIHMKyGG+
 tfbKYU7oWHBcllNKKrvpBhqhFy2LffVYOHWE8j8cRkG11GoPBKqfaCbyf5MMvWzgbi
 QKx49xUoNIGd9q9IjUSOp+RVWVnMMB0/KC3/XsAvMNj2BM502Y9bMKP+Izf13fSi8I
 p3yRD1ipUrQOKbGPxuv9LtL9wTjdawLy7idDFW4A0MQprt8tFSYCLNWdcHf1N6Zd6T
 SUoV/6mwD3hq4N2f8xTq6Jg0=
Received: from [192.168.178.251] (ijzerbout.connected.by.freedominter.net
 [185.238.128.139])
 by bout4.ijzerbout.nl (Postfix) with ESMTPSA id 8E81B41332;
 Wed, 24 Sep 2025 22:45:00 +0200 (CEST)
Message-ID: <e6da8bc1-12d2-433e-ad20-095c291e03d4@ijzerbout.nl>
Date: Wed, 24 Sep 2025 22:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 9/9] drm/xe/xe_late_bind_fw: Extract and print version
 info
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, mika.westerberg@linux.intel.com,
 lucas.demarchi@intel.com, karthik.poosa@intel.com
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
 <20250905154953.3974335-10-badal.nilawar@intel.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20250905154953.3974335-10-badal.nilawar@intel.com>
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

Op 05-09-2025 om 17:49 schreef Badal Nilawar:
> Extract and print version info of the late binding binary.
>
> v2: Some refinements (Daniele)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 124 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   3 +
>   drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  66 +++++++++++
>   3 files changed, 193 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 0f062008ca83..38f3feb2aecd 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -45,6 +45,121 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +static struct xe_device *
> +late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
> +{
> +	return container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id]);
> +}
> +
> +/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
> +static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
> +			    const void *data, size_t size, const char *manifest_entry)
> +{
> +	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
> +	const struct gsc_cpd_header_v2 *header = data;
> +	const struct gsc_manifest_header *manifest;
> +	const struct gsc_cpd_entry *entry;
> +	size_t min_size = sizeof(*header);
> +	u32 offset;
> +	int i;
> +
> +	/* manifest_entry is mandatory */
> +	xe_assert(xe, manifest_entry);
> +
> +	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
> +		return -ENOENT;
> +
> +	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
> +		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
> +			fw_id_to_name[lb_fw->id], header->header_length);
> +		return -EINVAL;
> +	}
> +
> +	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	/* Look for the manifest first */
> +	entry = (void *)header + header->header_length;
> +	for (i = 0; i < header->num_of_entries; i++, entry++)
> +		if (strcmp(entry->name, manifest_entry) == 0)
> +			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
> +
> +	if (!offset) {
This for loop looks suspicious. Do you continue the loop on purpose
after finding the first match? Or should there be a break?
Also, if there is no match then offset is uninitialized. Isn't it better
to initialize offset at the start?
-- 
Kees
