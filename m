Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E77A662432
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC72410E3DD;
	Mon,  9 Jan 2023 11:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E1710E3DD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EnnvChdqk1Z+ZGVOIW6755zSSpkoc71+R3gbA72lBx8=; b=iiYwvY1IGbb7K2olLqk1zhnTf2
 ql2WKrHxOXsEOukPeh1p1AjR0fxiY4nLTXguUvvL9Hck9ZHZoU/st1RINj4lp3PboU7uai5Fqna8d
 SylDSZvjiwT+DUnqjkZIUeCfD/lVNXfbpJpy5/AqG033lcqfSSVuiAh3fLibBjr3vecIh7vVcRtDj
 xg/JUZHHcxbWvMFeuvAockmtuo5KluoGEpRCUSPNdYeLRuandRULlX5MK7qGdEtibjUukIOPPiTyX
 80BX3enLTOBUibTd+SOjsX39pFYr6kYmLv2twp1ShNFTvd74aiP87wMl086oFvP7+IkdNJdUFqsI/
 Va0n9xGQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pEqKH-003KdB-QA; Mon, 09 Jan 2023 12:28:26 +0100
Message-ID: <c7cbcb01-d0ce-47bd-1d9d-e687ef9e5315@igalia.com>
Date: Mon, 9 Jan 2023 08:28:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm/debugfs: add descriptions to struct parameters
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230105193039.287677-1-mcanal@igalia.com>
 <20230105193039.287677-2-mcanal@igalia.com>
 <Y7iCOD1mylBX/VuB@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <Y7iCOD1mylBX/VuB@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 1/6/23 17:19, Daniel Vetter wrote:
> On Thu, Jan 05, 2023 at 04:30:39PM -0300, Maíra Canal wrote:
>> The structs drm_debugfs_info and drm_debugfs_entry don't have
>> descriptions for their parameters, which is causing the following warnings:
>>
>> include/drm/drm_debugfs.h:93: warning: Function parameter or member
>> 'name' not described in 'drm_debugfs_info'
>> include/drm/drm_debugfs.h:93: warning: Function parameter or member
>> 'show' not described in 'drm_debugfs_info'
>> include/drm/drm_debugfs.h:93: warning: Function parameter or member
>> 'driver_features' not described in 'drm_debugfs_info'
>> include/drm/drm_debugfs.h:93: warning: Function parameter or member
>> 'data' not described in 'drm_debugfs_info'
>> include/drm/drm_debugfs.h:105: warning: Function parameter or member
>> 'dev' not described in 'drm_debugfs_entry'
>> include/drm/drm_debugfs.h:105: warning: Function parameter or member
>> 'file' not described in 'drm_debugfs_entry'
>> include/drm/drm_debugfs.h:105: warning: Function parameter or member
>> 'list' not described in 'drm_debugfs_entry'
>>
>> Therefore, fix the warnings by adding descriptions to all struct
>> parameters.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   include/drm/drm_debugfs.h | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>> index 53b7297260a5..7616f457ce70 100644
>> --- a/include/drm/drm_debugfs.h
>> +++ b/include/drm/drm_debugfs.h
>> @@ -86,9 +86,22 @@ struct drm_info_node {
>>    * core.
>>    */
>>   struct drm_debugfs_info {
>> +	/** @name: File name */
>>   	const char *name;
>> +
>> +	/**
>> +	 * @show:
>> +	 *
>> +	 * Show callback. &seq_file->private will be set to the &struct
>> +	 * drm_debugfs_entry corresponding to the instance of this info
>> +	 * on a given &struct drm_device.
> 
> So this is a bit late, but why don't we pass that drm_debugfs_entry as an
> explicit parameter? Or maybe just the struct drm_device, because that and
> the void *data is really all there is to pass along. Would give us more
> type-safety, which really is the main reason for having drm-specific
> debugfs functions.

It seems like a better idea to pass the drm_debugfs_entry as an explicit
parameter. I can work on it, but I guess it is a better idea to finish
the conversion of all drm_debugfs_create_files() to drm_debugfs_add_files()
and then perform the change in the show() signature.

Best Regards,
- Maíra Canal

> 
> Either way, on the series: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
>> +	 */
>>   	int (*show)(struct seq_file*, void*);
>> +
>> +	/** @driver_features: Required driver features for this entry. */
>>   	u32 driver_features;
>> +
>> +	/** @data: Driver-private data, should not be device-specific. */
>>   	void *data;
>>   };
>>   
>> @@ -99,8 +112,13 @@ struct drm_debugfs_info {
>>    * drm_debugfs_info on a &struct drm_device.
>>    */
>>   struct drm_debugfs_entry {
>> +	/** @dev: &struct drm_device for this node. */
>>   	struct drm_device *dev;
>> +
>> +	/** @file: Template for this node. */
>>   	struct drm_debugfs_info file;
>> +
>> +	/** @list: Linked list of all device nodes. */
>>   	struct list_head list;
>>   };
>>   
>> -- 
>> 2.39.0
>>
> 
