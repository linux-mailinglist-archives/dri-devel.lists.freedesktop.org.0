Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569B4A7F110
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 01:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ADB10E582;
	Mon,  7 Apr 2025 23:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="asNUF5Z2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta034.useast.a.cloudfilter.net
 (omta034.useast.a.cloudfilter.net [44.202.169.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3115910E582
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 23:35:58 +0000 (UTC)
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
 by cmsmtp with ESMTPS
 id 1m16umIOkXshw1w0MuHlxI; Mon, 07 Apr 2025 23:35:50 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id 1w0MuxsCCrsgD1w0MuqDba; Mon, 07 Apr 2025 23:35:50 +0000
X-Authority-Analysis: v=2.4 cv=TNGOSEla c=1 sm=1 tr=0 ts=67f46156
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10
 a=4V2JOyclYXKWiCCFizwA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=97bElyQUpdy5ltz54fpnmGgcyORr0BUbRtAfywk6zQM=; b=asNUF5Z2It4rsXVDS9wI3cyuFL
 z5dmJT/VdtmEhWWqBsDWUHvckt/9PYfls8I6NdI6ZKRNQW05zzS8h1Lovv0rIo/ZibKl9kA4RK+Nk
 S/W5Ama6lE326TKtAlQiIXWHRvl4TX06hmfCHUlPvEg8sDryjz9PhzsUc9Jvj38lkJuv6Ae8EIOte
 9Ubg56Q+Hkj2AMXcDiRl0uSXQE6My8WhhrKnCr0ED2T0uFPfG1+KXQTGknyIT8xvX9kvrz96nzCOt
 /4K3tTTdjqrHxuqosXCKrs3O9bQHemWcYCqLkJ+h+gmNaGYg0z0Jo33Uo2cn1GXVaAgDNrHWg2q55
 QjuSa8Og==;
Received: from [201.172.174.147] (port=49836 helo=[192.168.15.6])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1u1w0L-00000000auU-0VGL;
 Mon, 07 Apr 2025 18:35:49 -0500
Message-ID: <a6dccb66-3f97-443f-85e5-fe089cd93a5e@embeddedor.com>
Date: Mon, 7 Apr 2025 17:35:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: chan: Avoid
 -Wflex-array-member-not-at-end warnings
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z-67Hm9uHEJs0RGw@kspp> <202504071227.E8484EB@keescook>
 <d8e63b8a-7a2c-46dc-a15c-9399044a23ee@embeddedor.com>
 <202504071336.0C708FCAB8@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202504071336.0C708FCAB8@keescook>
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
X-Exim-ID: 1u1w0L-00000000auU-0VGL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.6]) [201.172.174.147]:49836
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLvivA0hNEr92osUpZvhPJiMbs3amhTa3baveEYQFbuVewWPHVxgpP1NjNs9tx/fVxvIXRlY3tYlEDl0WLZU2o9b95MDQTqSUn8AYALfSQHLVGqsMF+o
 grNKlGLhMRNPUttrhbfHrW+tecozyexrJMy9eDWlepq1x2wX9jIXa0AKoxSD5kJVRpYisLEshnNhbQASyofBFVa3rUgklCw+XBIh+RWx+5gG983DuyFUshhc
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

[..]

>>>> -	struct {
>>>> -		struct nvif_chan_v0 chan;
>>>> -		char name[TASK_COMM_LEN+16];
>>>> -	} args;
>>>> +	DEFINE_RAW_FLEX(struct nvif_chan_v0, args, name, TASK_COMM_LEN + 16);
>>>>    	struct nvif_device *device = &cli->device;
>>>>    	struct nouveau_channel *chan;
>>>>    	const u64 plength = 0x10000;
>>>> @@ -298,28 +295,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
>>>>    		return ret;
>>>>    	/* create channel object */
>>>> -	args.chan.version = 0;
>>>> -	args.chan.namelen = sizeof(args.name);
>>>> -	args.chan.runlist = __ffs64(runm);
>>>> -	args.chan.runq = 0;
>>>> -	args.chan.priv = priv;
>>>> -	args.chan.devm = BIT(0);
>>>> +	args->version = 0;
>>>> +	args->namelen = __struct_size(args) - sizeof(*args);
>>>
>>> Does __struct_size(args->name) work here (and later)?
>>
>> Why not?
> 
> Uhm, I'm genuinely curious. I *think* it will work, but because it's
> within the struct, not outside of it, I'm unclear if it'll DTRT for
> finding the size (since __builtin_object_size() can be touchy).
> 
>> I mean, this should be equivalent to `TASK_COMM_LEN+16`, I could
>> use the latter if people prefer it (see my comments below).
> 
> Right, it should be the same. I think __struct_size(args->name) would be
> much more readable ... if it works. :)

OK, I'll double check this.

[..]

>>>> @@ -367,17 +365,17 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
>>>>    		return ret;
>>>>    	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
>>>> -		struct {
>>>> -			struct nvif_event_v0 base;
>>>> -			struct nvif_chan_event_v0 host;
>>>> -		} args;
>>>> +		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
>>>> +				sizeof(struct nvif_chan_event_v0));
>>>> +		struct nvif_chan_event_v0 *host =
>>>> +				(struct nvif_chan_event_v0 *)args->data;
>>>> -		args.host.version = 0;
>>>> -		args.host.type = NVIF_CHAN_EVENT_V0_KILLED;
>>>> +		host->version = 0;
>>>> +		host->type = NVIF_CHAN_EVENT_V0_KILLED;
>>>>    		ret = nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
>>>>    				      nouveau_channel_killed, false,
>>>> -				      &args.base, sizeof(args), &chan->kill);
>>>> +				      args, __struct_size(args), &chan->kill);
>>>>    		if (ret == 0)
>>>>    			ret = nvif_event_allow(&chan->kill);
>>>>    		if (ret) {
>>>> @@ -520,46 +518,45 @@ nouveau_channels_fini(struct nouveau_drm *drm)
>>>>    int
>>>>    nouveau_channels_init(struct nouveau_drm *drm)
>>>>    {
>>>> -	struct {
>>>> -		struct nv_device_info_v1 m;
>>>> -		struct {
>>>> -			struct nv_device_info_v1_data channels;
>>>> -			struct nv_device_info_v1_data runlists;
>>>> -		} v;
>>>> -	} args = {
>>>> -		.m.version = 1,
>>>> -		.m.count = sizeof(args.v) / sizeof(args.v.channels),
>>>
>>> sizeof(args.v) == sizeof(struct nv_device_info_v1_data) * 2
>>>
>>> and sizeof(args.v.channels) == sizeof(struct nv_device_info_v1_data).
>>>
>>> Isn't this just "2"? i.e. isn't struct nv_device_info_v1::count the
>>> counted_by for struct nv_device_info_v1::data?
>>
>> Yes, it's just `2`. However, I didn't want to explicitly use the magic
>> number, in case people don't like it, as in other similar patches (in
>> other subsystems).
>>
>> But, yeah, it's `2`. :)
> 
> Okay. So if "count" is set up as a counted_by, the assignment will
> happen automatically (in DEFINE_FLEX -- no longer "RAW").

I really don't want to condition -Wflex-array-member-not-at-end patches
on counted_by patches, for now.

Thanks
--
Gustavo
