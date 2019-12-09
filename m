Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C010118266
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFED089CAD;
	Tue, 10 Dec 2019 08:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631796E2D7;
 Mon,  9 Dec 2019 18:43:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dee95dd0000>; Mon, 09 Dec 2019 10:43:41 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 10:43:46 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 10:43:46 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 18:43:46 +0000
Received: from [10.40.101.166] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec 2019
 18:43:43 +0000
Subject: Re: [PATCH v3 11/12] samples: vfio-mdev: constify fb ops
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <ddb10df1316ef585930cda7718643a580f4fe37b.1575390741.git.jani.nikula@intel.com>
 <87tv694myu.fsf@intel.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <0d5434e0-3d86-bbb8-6377-94e00b4f0d78@nvidia.com>
Date: Tue, 10 Dec 2019 00:13:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87tv694myu.fsf@intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575917021; bh=/7RvFJCUG4iQV+IDvVpbMgXKzJOkAMSMaevIPIjioqo=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Y6wZDvVdMVatstmzKu5SutbP2nXXb/rNT7RvDQBaUBpwel/Ppk8RHXTPSUsY2JLEI
 GPHAGnnjRUNVizRoR8Bik/EAkJv1xkvimXAesz8C2O1+4klexm8wQ8Z8yaXj+b1rRe
 c2DJ3atEyFticNm2EfmFogYLEVO30JoyzqWFA7g/xLNwAFICp1XbuysYXsrFqTTaIe
 WnmR99W4Z45WDhf3Hm7c8UcaSe8GU3sTXSiKOMqsR9q0oM/QX/Xk7J1NroSifpKyH4
 6zfoBCmb1xYefKzninwV27B8XFwLuBGgpIkFtsmaBxU/k/iDVguLzezRXylNSPloeg
 F1vJUI8bn7FaQ==
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 kvm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/9/2019 7:31 PM, Jani Nikula wrote:
> On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
>> Now that the fbops member of struct fb_info is const, we can start
>> making the ops const as well.
>>
>> v2: fix	typo (Christophe de Dinechin)
>>
>> Cc: Kirti Wankhede <kwankhede@nvidia.com>
>> Cc: kvm@vger.kernel.org
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> Kirti, may I have your ack to merge this through drm-misc please?
> 
> BR,
> Jani.
> 
>> ---
>>   samples/vfio-mdev/mdpy-fb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
>> index 2719bb259653..21dbf63d6e41 100644
>> --- a/samples/vfio-mdev/mdpy-fb.c
>> +++ b/samples/vfio-mdev/mdpy-fb.c
>> @@ -86,7 +86,7 @@ static void mdpy_fb_destroy(struct fb_info *info)
>>   		iounmap(info->screen_base);
>>   }
>>   
>> -static struct fb_ops mdpy_fb_ops = {
>> +static const struct fb_ops mdpy_fb_ops = {
>>   	.owner		= THIS_MODULE,
>>   	.fb_destroy	= mdpy_fb_destroy,
>>   	.fb_setcolreg	= mdpy_fb_setcolreg,
> 

Acked-by : Kirti Wankhede <kwankhede@nvidia.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
