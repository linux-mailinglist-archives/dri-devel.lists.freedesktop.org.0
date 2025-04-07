Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF79A7EE12
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 21:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37AD10E405;
	Mon,  7 Apr 2025 19:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="AVAopYbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta036.useast.a.cloudfilter.net
 (omta036.useast.a.cloudfilter.net [44.202.169.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E7D10E405
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 19:57:59 +0000 (UTC)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
 by cmsmtp with ESMTPS
 id 1nlGu9k1PzZPa1sbPuvA71; Mon, 07 Apr 2025 19:57:52 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id 1sbOungOsEW6x1sbPuSnwd; Mon, 07 Apr 2025 19:57:51 +0000
X-Authority-Analysis: v=2.4 cv=MsNU6Xae c=1 sm=1 tr=0 ts=67f42e3f
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=7uxg95fy6kqncDjJJCgA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yeTqSNh5wvMq1AuGfJRbvqgnVUFu7Bju2bJWfkxGsL8=; b=AVAopYbgXF9Q8S1Rm7e790qQYG
 nU82WNSw5adlIxyWfJpKcedeEzKhLZY0QGle+29PYXdUiYMWkHToRIb9C+XWS4/8M1SyB0TgDxuXv
 KkY/na9eG+JmqwgLC4nPHxq6XCtjwIv8AEkVg+O78VPQkvCOaqanEM1VYBW2H679pjbG+zae4jRjE
 pE7dbMLw6pVny++KMVS+aCnrQVlfMHxo0QY0dhiLJgMuM4Am22Vf8Nb65WOdXuPSW5txlUv6EeRjm
 4i4W0eubcdvEyfF0vKmAq+7hva5UunMgv571iMD4GWvtzrJUpcLWh277VeAPTJcTL4Qm09EE3njDi
 E1CAKC6w==;
Received: from [201.172.174.147] (port=36762 helo=[192.168.15.6])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1u1sbO-00000001mlB-0scu;
 Mon, 07 Apr 2025 14:57:50 -0500
Message-ID: <d8e63b8a-7a2c-46dc-a15c-9399044a23ee@embeddedor.com>
Date: Mon, 7 Apr 2025 13:57:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: chan: Avoid
 -Wflex-array-member-not-at-end warnings
To: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z-67Hm9uHEJs0RGw@kspp> <202504071227.E8484EB@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202504071227.E8484EB@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1u1sbO-00000001mlB-0scu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.6]) [201.172.174.147]:36762
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 33
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBzRE8gsiX9oQPTH3KO5po4UvgTIwOR0Ub27e8RsJqeYsBvhjRTco9fQmPVbrUWWvp9va8m2Rj/OQ8rkzQ+ycwHBf2jgLVSX+kTkoagmRw+pKgFLJcR4
 s9tKH/IPpoYYXVbV3rxoJUspkMx9htpySkvLPxoh/p3Enkgx68+MIh9phw5NJEEI4toGD7+kQuoRAsTfV1cglzZzjpEUMpnBSMf1upH0hsFBiFWDx7QfAdCa
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



On 07/04/25 13:50, Kees Cook wrote:
> On Thu, Apr 03, 2025 at 10:45:18AM -0600, Gustavo A. R. Silva wrote:
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> Use the `DEFINE_RAW_FLEX()` helper for a few on-stack definitions
>> of a flexible structure where the size of the flexible-array member
>> is known at compile-time, and refactor the rest of the code,
>> accordingly.
>>
>> So, with these changes, fix the following warnings:
>>
>> drivers/gpu/drm/nouveau/nouveau_chan.c:274:37: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/gpu/drm/nouveau/nouveau_chan.c:371:46: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/gpu/drm/nouveau/nouveau_chan.c:524:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_chan.c | 115 ++++++++++++-------------
>>   1 file changed, 56 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
>> index cd659b9fd1d9..a7e70517b7cd 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
>> @@ -270,10 +270,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
>>   		{    NV03_CHANNEL_DMA     , 0 },
>>   		{}
>>   	};
>> -	struct {
>> -		struct nvif_chan_v0 chan;
>> -		char name[TASK_COMM_LEN+16];
>> -	} args;
>> +	DEFINE_RAW_FLEX(struct nvif_chan_v0, args, name, TASK_COMM_LEN + 16);
>>   	struct nvif_device *device = &cli->device;
>>   	struct nouveau_channel *chan;
>>   	const u64 plength = 0x10000;
>> @@ -298,28 +295,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
>>   		return ret;
>>   
>>   	/* create channel object */
>> -	args.chan.version = 0;
>> -	args.chan.namelen = sizeof(args.name);
>> -	args.chan.runlist = __ffs64(runm);
>> -	args.chan.runq = 0;
>> -	args.chan.priv = priv;
>> -	args.chan.devm = BIT(0);
>> +	args->version = 0;
>> +	args->namelen = __struct_size(args) - sizeof(*args);
> 
> Does __struct_size(args->name) work here (and later)?

Why not?

I mean, this should be equivalent to `TASK_COMM_LEN+16`, I could
use the latter if people prefer it (see my comments below).

> 
>> +	args->runlist = __ffs64(runm);
>> +	args->runq = 0;
>> +	args->priv = priv;
>> +	args->devm = BIT(0);
>>   	if (hosts[cid].oclass < NV50_CHANNEL_GPFIFO) {
>> -		args.chan.vmm = 0;
>> -		args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
>> -		args.chan.offset = chan->push.addr;
>> -		args.chan.length = 0;
>> +		args->vmm = 0;
>> +		args->ctxdma = nvif_handle(&chan->push.ctxdma);
>> +		args->offset = chan->push.addr;
>> +		args->length = 0;
>>   	} else {
>> -		args.chan.vmm = nvif_handle(&chan->vmm->vmm.object);
>> +		args->vmm = nvif_handle(&chan->vmm->vmm.object);
>>   		if (hosts[cid].oclass < FERMI_CHANNEL_GPFIFO)
>> -			args.chan.ctxdma = nvif_handle(&chan->push.ctxdma);
>> +			args->ctxdma = nvif_handle(&chan->push.ctxdma);
>>   		else
>> -			args.chan.ctxdma = 0;
>> -		args.chan.offset = ioffset + chan->push.addr;
>> -		args.chan.length = ilength;
>> +			args->ctxdma = 0;
>> +		args->offset = ioffset + chan->push.addr;
>> +		args->length = ilength;
>>   	}
>> -	args.chan.huserd = 0;
>> -	args.chan.ouserd = 0;
>> +	args->huserd = 0;
>> +	args->ouserd = 0;
>>   
>>   	/* allocate userd */
>>   	if (hosts[cid].oclass >= VOLTA_CHANNEL_GPFIFO_A) {
>> @@ -329,27 +326,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
>>   		if (ret)
>>   			return ret;
>>   
>> -		args.chan.huserd = nvif_handle(&chan->mem_userd.object);
>> -		args.chan.ouserd = 0;
>> +		args->huserd = nvif_handle(&chan->mem_userd.object);
>> +		args->ouserd = 0;
>>   
>>   		chan->userd = &chan->mem_userd.object;
>>   	} else {
>>   		chan->userd = &chan->user;
>>   	}
>>   
>> -	snprintf(args.name, sizeof(args.name), "%s[%d]", current->comm, task_pid_nr(current));
>> +	snprintf(args->name, __struct_size(args) - sizeof(*args), "%s[%d]",
>> +		 current->comm, task_pid_nr(current));
>>   
>>   	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, hosts[cid].oclass,
>> -			       &args, sizeof(args), &chan->user);
>> +			       args, __struct_size(args), &chan->user);
>>   	if (ret) {
>>   		nouveau_channel_del(pchan);
>>   		return ret;
>>   	}
>>   
>> -	chan->runlist = args.chan.runlist;
>> -	chan->chid = args.chan.chid;
>> -	chan->inst = args.chan.inst;
>> -	chan->token = args.chan.token;
>> +	chan->runlist = args->runlist;
>> +	chan->chid = args->chid;
>> +	chan->inst = args->inst;
>> +	chan->token = args->token;
>>   	return 0;
>>   }
>>   
>> @@ -367,17 +365,17 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
>>   		return ret;
>>   
>>   	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
>> -		struct {
>> -			struct nvif_event_v0 base;
>> -			struct nvif_chan_event_v0 host;
>> -		} args;
>> +		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
>> +				sizeof(struct nvif_chan_event_v0));
>> +		struct nvif_chan_event_v0 *host =
>> +				(struct nvif_chan_event_v0 *)args->data;
>>   
>> -		args.host.version = 0;
>> -		args.host.type = NVIF_CHAN_EVENT_V0_KILLED;
>> +		host->version = 0;
>> +		host->type = NVIF_CHAN_EVENT_V0_KILLED;
>>   
>>   		ret = nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
>>   				      nouveau_channel_killed, false,
>> -				      &args.base, sizeof(args), &chan->kill);
>> +				      args, __struct_size(args), &chan->kill);
>>   		if (ret == 0)
>>   			ret = nvif_event_allow(&chan->kill);
>>   		if (ret) {
>> @@ -520,46 +518,45 @@ nouveau_channels_fini(struct nouveau_drm *drm)
>>   int
>>   nouveau_channels_init(struct nouveau_drm *drm)
>>   {
>> -	struct {
>> -		struct nv_device_info_v1 m;
>> -		struct {
>> -			struct nv_device_info_v1_data channels;
>> -			struct nv_device_info_v1_data runlists;
>> -		} v;
>> -	} args = {
>> -		.m.version = 1,
>> -		.m.count = sizeof(args.v) / sizeof(args.v.channels),
> 
> sizeof(args.v) == sizeof(struct nv_device_info_v1_data) * 2
> 
> and sizeof(args.v.channels) == sizeof(struct nv_device_info_v1_data).
> 
> Isn't this just "2"? i.e. isn't struct nv_device_info_v1::count the
> counted_by for struct nv_device_info_v1::data?

Yes, it's just `2`. However, I didn't want to explicitly use the magic
number, in case people don't like it, as in other similar patches (in
other subsystems).

But, yeah, it's `2`. :)

Thanks
--
Gustavo

> 
>> -		.v.channels.mthd = NV_DEVICE_HOST_CHANNELS,
>> -		.v.runlists.mthd = NV_DEVICE_HOST_RUNLISTS,
>> -	};
>> +	DEFINE_RAW_FLEX(struct nv_device_info_v1, args, data, 2);
>> +	struct nv_device_info_v1_data *channels = &args->data[0];
>> +	struct nv_device_info_v1_data *runlists = &args->data[1];
>>   	struct nvif_object *device = &drm->client.device.object;
>>   	int ret, i;
>>   
>> -	ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, &args, sizeof(args));
>> +	args->version = 1;
>> +	args->count = (__struct_size(args) - sizeof(*args)) /
>> +		      sizeof(*args->data);
>> +	channels->mthd = NV_DEVICE_HOST_CHANNELS;
>> +	runlists->mthd = NV_DEVICE_HOST_RUNLISTS;
>> +
>> +	ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, args,
>> +			       __struct_size(args));
>>   	if (ret ||
>> -	    args.v.runlists.mthd == NV_DEVICE_INFO_INVALID || !args.v.runlists.data ||
>> -	    args.v.channels.mthd == NV_DEVICE_INFO_INVALID)
>> +	    runlists->mthd == NV_DEVICE_INFO_INVALID || !runlists->data ||
>> +	    channels->mthd == NV_DEVICE_INFO_INVALID)
>>   		return -ENODEV;
>>   
>> -	drm->chan_nr = drm->chan_total = args.v.channels.data;
>> -	drm->runl_nr = fls64(args.v.runlists.data);
>> +	drm->chan_nr = drm->chan_total = channels->data;
>> +	drm->runl_nr = fls64(runlists->data);
>>   	drm->runl = kcalloc(drm->runl_nr, sizeof(*drm->runl), GFP_KERNEL);
>>   	if (!drm->runl)
>>   		return -ENOMEM;
>>   
>>   	if (drm->chan_nr == 0) {
>>   		for (i = 0; i < drm->runl_nr; i++) {
>> -			if (!(args.v.runlists.data & BIT(i)))
>> +			if (!(runlists->data & BIT(i)))
>>   				continue;
>>   
>> -			args.v.channels.mthd = NV_DEVICE_HOST_RUNLIST_CHANNELS;
>> -			args.v.channels.data = i;
>> +			channels->mthd = NV_DEVICE_HOST_RUNLIST_CHANNELS;
>> +			channels->data = i;
>>   
>> -			ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, &args, sizeof(args));
>> -			if (ret || args.v.channels.mthd == NV_DEVICE_INFO_INVALID)
>> +			ret = nvif_object_mthd(device, NV_DEVICE_V0_INFO, args,
>> +					       __struct_size(args));
>> +			if (ret || channels->mthd == NV_DEVICE_INFO_INVALID)
>>   				return -ENODEV;
>>   
>> -			drm->runl[i].chan_nr = args.v.channels.data;
>> +			drm->runl[i].chan_nr = channels->data;
>>   			drm->runl[i].chan_id_base = drm->chan_total;
>>   			drm->runl[i].context_base = dma_fence_context_alloc(drm->runl[i].chan_nr);
>>   
> 
> Otherwise looks good.
> 
> -Kees
> 

