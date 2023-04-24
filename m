Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A16ECFF0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 16:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD9D10E527;
	Mon, 24 Apr 2023 14:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id E135E10E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 14:07:42 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:56046.1777299264
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 5900410026E;
 Mon, 24 Apr 2023 22:07:36 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 b96101ecef424972bd508052d9d47069 for emil.l.velikov@gmail.com; 
 Mon, 24 Apr 2023 22:07:38 CST
X-Transaction-ID: b96101ecef424972bd508052d9d47069
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <aaad7121-538b-e2ad-8334-2682a120ed9b@189.cn>
Date: Mon, 24 Apr 2023 22:07:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 2/2] drm: add kms driver for loongson display
 controller
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230403171304.2157326-1-suijingfeng@loongson.cn>
 <20230403171304.2157326-3-suijingfeng@loongson.cn>
 <CACvgo53h+X26wngVmxpn3oVb9kbJezTHx61p3rZDR7sw1AQrWQ@mail.gmail.com>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CACvgo53h+X26wngVmxpn3oVb9kbJezTHx61p3rZDR7sw1AQrWQ@mail.gmail.com>
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
Cc: nathan@kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Li Yi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/4/4 22:10, Emil Velikov wrote:
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
>> +void lsdc_debugfs_init(struct drm_minor *minor)
>> +{
>> +#ifdef CONFIG_DEBUG_FS
>> +       drm_debugfs_create_files(lsdc_debugfs_list,
>> +                                ARRAY_SIZE(lsdc_debugfs_list),
>> +                                minor->debugfs_root,
>> +                                minor);
>> +#endif
>> +}
> Should probably build the file when debugfs is enabled and provide
> no-op stub in the header. See nouveau for an example.
>
>
It seem that the drm core already done this for us, are we really need 
those #ifdef guard anymore?

I remove all of the  #ifdef CONFIG_DEBUG_FS in my program and disable 
the debugfs option in menuconfig

my driver compile without any error.

