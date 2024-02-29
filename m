Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727FD86CC66
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65A310E39E;
	Thu, 29 Feb 2024 15:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tghmHuKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902B10E39E;
 Thu, 29 Feb 2024 15:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EckK06Tw6tmW1KDcZYu3j1TBVA1lAfgnguAGwqI1TqvA/SXQdVYuQEiWOxJBhgkaxP913hblYGHWoODYboBjpR/4fozM968ElbikgK2/eCUGuS1yRyvdCdgMrcdHBm6Uqa9hnK0j+fgjWar1kP5wN27mZuB0jaEl/lLcffYyBItqTGkMBejPA2hJGlLsk+wIV2wWrcIagMtxMRFRdwOF7J17DLFo4/9ZPiAQSvCYKNMMWg7Q5WeD0OY0KjVh7uoKuaCdZAuyy2tYxPKkryJlfsPaxHUbF3G0hpEDV87DoEGK356I6tZPKOxkpSK4HZhRBb0xhxhnrO/rAf5BlCuyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+pI9yGibRVNMtgsTkOjnM60QobhnTu5WdP5HpkUZZc=;
 b=cyauHZbVUgBACg0jvWMwZKY9CfjpzUb3WW8fGXDuH5LdqrrMmjCd+hN1ciPLoAm6NVro194K5jsWHfdmgbl/n87ga1TXBmxdfEgxot28XxzH1YYveJZ1T1zoxxE5RdnEPUCnx+WocTHVNY4Kw6YwDirAIOOzQWqyFd5JkfItUG6Ybbftovn8O+5zP2QsXpLRKWCLQ0YKZ3LoWnLdcwlCrgo5euaHNt0aLlbA5RfzdIO+wXil58BOobpGvh8TTUNzhzv+H5kulz/dBCrucYMakEW8MSjuSgzEYFZlcEPQNHt+nm1f0dlGs4y3mU7JXmv8SKsyPSllN6uMRfiqprOvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+pI9yGibRVNMtgsTkOjnM60QobhnTu5WdP5HpkUZZc=;
 b=tghmHuKDxXQcVFMGN2RdkRcV+/unZWO/QDwBSKAf283PCraLY3BZqh/uD/fPDHpI2Nw20673lWbhJXWjBgRmYQiPQsjYQRVufyxAFCbzLCw7NBnUibNcCYxNtnwP3zsQeuwo/hhakN/OVFoJxDGuJY8NXVQV/ahleexBT2LXzOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 15:08:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Thu, 29 Feb 2024
 15:08:50 +0000
Content-Type: multipart/alternative;
 boundary="------------3jjBzPfZ2sKtzPi1eA02MLjj"
Message-ID: <c4f85901-1461-42e4-8db1-49877837e398@amd.com>
Date: Thu, 29 Feb 2024 16:08:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] TTM unlockable restartable LRU list iteration
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@list.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
 <29000a0d-19ce-4727-945b-d5734313c7f1@amd.com>
 <47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com>
X-ClientProxiedBy: FR5P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: a3196a9e-19cf-4cea-1d9f-08dc393855b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwCsMVgK6B5G8EIxS00NDKESNLDzXAHPgII8/1h+8VmWJHpFDnd/rgbMHmzDvq0ItgpnSVwNe6F1Elp8TqMI6nT3IQ3aVWMHx1ZOiGWVAEUpI9lDsGTrfW53vjBCEG/zc1mfcM2DRZ56roEZ0YgAnLKjdejDRFslLqBl7Nu8v6Y4t8lVbQ9cnvtbcqRXvcYj5HmGJsyTWXr4eD1X8jBbvDAP9/VMRQAWSJcsPpCxxPcsGPV3GjykCi1U7/1zT4BoFQ9ucu2+A8yaTh40g98yTqyROXRBHW6A2t4by12J5pcSm0gPcRbeusUFut4GJB1VC5+F4y1gI01Qrr/Eg1xVT8QKiCxdduhNT9Tjj7cBvWEORx5u/bQEo4jH6yMwAGDYPmmmwwRpqBrxjiPabHXcLEYPKBgOQ4wHmev+vGbpe+jQ5zMmC06coJyIu3MRS7/NclBzHpisPi/tJkgd0oOtIIpVWQlKd0hxNAATbtGn2tjPrNmcknGRE+GwUdOPNNS5NcwIuUxF6e8VBJwRXfnhsHjsGeoMAZo7fWyYetjHdIAJtr9l79196hdphPTDKtovN12pgJHZGPGt5V4nt6kdVg7oQJjC+oUx7/Vpg01LQTU8JCD2tfbP6ziS/IelT9LZ+Y9L8DvqAy9UiucKTIQD1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVQzWTRmL2dRTXVabFVVKzllTUd0R1gwSlNGY0VVQUZhTXEreUFCaHhGODM4?=
 =?utf-8?B?elFuV1dhbG5NcTJENytJOGhUTGVGbCtpUDIrMTI3b3lyeXNUOER3RFRDaXdV?=
 =?utf-8?B?alphZHlFcktOSDc1aVV2MTNSU29rdDYveEFHZERXa2Zvc0kxL1o0ZEZoTjZ1?=
 =?utf-8?B?eERFbCtIcExSRVkyVTNRRDNBU2RzZDYwY1VhVk03NHcySm5EaDVtbWY4Mko1?=
 =?utf-8?B?YktLVFZRMU45UEhpbGc0YkkwcmRmbUZ3QnBGd1VGMnNqMGVUYTVUckVKYnBq?=
 =?utf-8?B?WjVkazY4VFN6ZlNUbkNESDJjbm03N2diKytkeTA1OXVtQkk0VUE1a0N1b2Uw?=
 =?utf-8?B?dEordEp4MzJSTE9leVFSY0lISTZnb0dTV2ZHbGhSMStSUmlqOHAyQllhM3FN?=
 =?utf-8?B?bVloNmxtVVNIMEhxMUZUbndQZENQTG9CNVRGZ1QxVGlER2lVSHNjTEkyWHNL?=
 =?utf-8?B?OXRVcFBrUi9ZMCtmSjZDZXR4WWJaYnpGSTI4RGx2UVN0TGRVU0pYa2lyYjQx?=
 =?utf-8?B?dG5WUll2ZWlIa25KcU11WEpsaWtjdmdMM0ZoUVZrK3Rxa1k1emRtenB2L0Fk?=
 =?utf-8?B?RUZPcHNRTVRVVGZ2SjBhVGhaNFViblJIR2QvaDdmZXJnT28vL0EwWHBIWnh5?=
 =?utf-8?B?WFBHaC94WmEvY2QvNTRPSlU2Q254Q2hjMFZLOCtCbm92VkNUNC9ySnNKUUVq?=
 =?utf-8?B?SXR5VGRZWVU2NzdBNjQ2OWRBNlloTWhBc0Fwb2hOOGVpOTFCR0tOa2lVTk9l?=
 =?utf-8?B?L05MZUZrRlBualQ1Z01JYitMcGxaUWx6RS9sUFowSEk2ditzQ0t5cVRxVnlm?=
 =?utf-8?B?K3g3VkQ5Q055aGR0ZmFFUEl0NjYvMVdLcktQdFZSazNzcGZSSGd2VHpQblRR?=
 =?utf-8?B?RzJjallUVlVVbmVBNXhKQmlPT2Ntajh1cjFITXFNODlwRkJBdjdJWmNNUlBu?=
 =?utf-8?B?RnJFRGZ6cER3ei9JRFpZaWVobk5QVWpaQlN6dmd0QnE1WWQ1aUg3N2cxK24z?=
 =?utf-8?B?RUczcUZTNkVaU1NXMndsNWZCZ05GdWJGRWtacjBEVkNIdzVzSEJId1FmZUtz?=
 =?utf-8?B?TEgvQTdvV1ZnTXRzRzgyNjcxT2ZDZkt4dlc2SmJUVGhmakdtUFlVNHdWdEtn?=
 =?utf-8?B?ZWFGRkxOUEtiYWU5dzIwQ29SZGNuZVljRGl4VDdmTHlub1RrSWJCZCtVY211?=
 =?utf-8?B?M1FNbFdRM3pCOEVEU25NeWdMUEErTXQvaW5MSll0OU9mNFRuRHlGY1JGZXI1?=
 =?utf-8?B?bUZKL0g1T3VsRXBYU3pQU2ljOUk2MmdnZDFjcTB1ODZlUlNYa2FFemlVVkZO?=
 =?utf-8?B?MDRXc3loL1poRFhjc2pCREl5K2UwZFNrNTRrUmxXN0tRclo3cGRlcHJiQTFr?=
 =?utf-8?B?ZTk4YUZaYnowdlp3U1NNMVBzZEdOM3JJbnpkd1NsMDJUVEdSVWFaeUNZb1Yv?=
 =?utf-8?B?WlhxZVZ1cnVaVDJMa21wYUc5K1JoT2Z2enVXZHhxVEFDN2RYdFlVN0RjSHN5?=
 =?utf-8?B?a05WMm5LbnBYeW94MDJBL0Z0ZG9Pekdhb3lSTGZMMVRmV2JSSi95YUpyNEty?=
 =?utf-8?B?bzNHeFFtSVc0c0Y5MGhmWEw5dkx2SzVNVWdBd1pUa3ZOMmVMTlJjTkRlOVVF?=
 =?utf-8?B?VUVYQ3JwcXl6WUFremVHS1d5TklWTVBWSGNSbUUvQTFsbng5WTlkMmtlQzYw?=
 =?utf-8?B?VG41cDQrV1pHa1kva2ovWU41YjY4YXhIcXU1a21YczF5NHRaZmVxTjZoaDUv?=
 =?utf-8?B?RUdPbFMvN2VNZENZdnNHS3RlYnRPalRiQWNzT2dFbkJoTDAzS0puR1RqcVBL?=
 =?utf-8?B?VWtOZnBIaWNOQUl2aDdlOFpMNWZBM2ptWndpYWQvQm9XcFpNRjlaZTJ5blAv?=
 =?utf-8?B?dE1obm90aC9IQUVWbm5LVXU5MkNVblBvTXR2c0VweTJTank1N3p1NHNtbjNl?=
 =?utf-8?B?Y3oyZElDVmJQdEoxZkpKK2o1TEFYLzNtTHVmVkVUR3hXMEdEa2JlZWNYV0VR?=
 =?utf-8?B?ZDZlNUZJQUVTRlp3VWpHVUpoS0tNWkpBbmF1N25QS1dKdHJzdFVPVFNDZFF3?=
 =?utf-8?B?TVIrNGFuZUtOcjFPdTVEblBZMUlwNnpQbFF2azNIa0ljOVZyK3NncTVpWEJt?=
 =?utf-8?Q?qXdmUozF9RCxxxoNCIDMbwlfi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3196a9e-19cf-4cea-1d9f-08dc393855b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 15:08:50.1216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTw9P0L8G1NiENS8FW9QIiXTzmQl5fWIEdlY6DdWQQfrZUVveaPz4PEgC9E2cvov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
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

--------------3jjBzPfZ2sKtzPi1eA02MLjj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 16.02.24 um 15:20 schrieb Thomas Hellström:
[SNIP]
>> My approach was basically to not only lock the current BO, but also
>> the
>> next one. Since only a locked BO can move on the LRU we effectively
>> created an anchor.
>>
>> Before I dig into the code a couple of questions:
> These are described in the patches but brief comments inline.
>
>> 1. How do you distinct BOs and iteration anchors on the LRU?
> Using a struct ttm_lru_item, containing a struct list_head and the
> type. List nodes embeds this instead of a struct list_head. This is
> larger than the list head but makes it explicit what we're doing.

Need to look deeper into the code of this, but it would be nice if we 
could abstract that better somehow.

>> 2. How do you detect that a bulk list moved on the LRU?
> An age u64 counter on the bulk move that we're comparing against. It's
> updated each time it moves.
>
>
>> 3. How do you remove the iteration anchors from the bulk list?
> A function call at the end of iteration, that the function iterating is
> requried to call.

Thinking quite a bit about that in the last week and I came to the 
conclusion that this might be overkill.

All BOs in a bulk share the same reservation object. So when you 
acquired one you can just keep the dma-resv locked even after evicting 
the BO.

Since moving BOs requires locking the dma-resv object the whole problem 
then just boils down to a list_for_each_element_safe().

That's probably a bit simpler than doing the add/remove dance.

Regards,
Christian.

>
>
> /Thomas
>
>> Regards,
>> Christian.
>>
>>> The restartable property is used in patch 4 to restart swapout if
>>> needed, but the main purpose is this paves the way for
>>> shrinker- and exhaustive eviction.
>>>
>>> Cc: Christian König<christian.koenig@amd.com>
>>> Cc:<dri-devel@lists.freedesktop.org>
>>>
>>> Thomas Hellström (4):
>>>     drm/ttm: Allow TTM LRU list nodes of different types
>>>     drm/ttm: Use LRU hitches
>>>     drm/ttm: Consider hitch moves within bulk sublist moves
>>>     drm/ttm: Allow continued swapout after -ENOSPC falure
>>>
>>>    drivers/gpu/drm/ttm/ttm_bo.c       |   1 +
>>>    drivers/gpu/drm/ttm/ttm_device.c   |  33 +++--
>>>    drivers/gpu/drm/ttm/ttm_resource.c | 202 +++++++++++++++++++++++-
>>> -----
>>>    include/drm/ttm/ttm_resource.h     |  91 +++++++++++--
>>>    4 files changed, 267 insertions(+), 60 deletions(-)
>>>

--------------3jjBzPfZ2sKtzPi1eA02MLjj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 16.02.24 um 15:20 schrieb Thomas Hellström:<br>
    [SNIP]<br>
    <blockquote type="cite" cite="mid:47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">My approach was basically to not only lock the current BO, but also
the 
next one. Since only a locked BO can move on the LRU we effectively 
created an anchor.

Before I dig into the code a couple of questions:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">These are described in the patches but brief comments inline.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">1. How do you distinct BOs and iteration anchors on the LRU?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Using a struct ttm_lru_item, containing a struct list_head and the
type. List nodes embeds this instead of a struct list_head. This is
larger than the list head but makes it explicit what we're doing.</pre>
    </blockquote>
    <br>
    Need to look deeper into the code of this, but it would be nice if
    we could abstract that better somehow.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">2. How do you detect that a bulk list moved on the LRU?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">An age u64 counter on the bulk move that we're comparing against. It's
updated each time it moves.


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">3. How do you remove the iteration anchors from the bulk list?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">A function call at the end of iteration, that the function iterating is
requried to call.</pre>
    </blockquote>
    <br>
    Thinking quite a bit about that in the last week and I came to the
    conclusion that this might be overkill.<br>
    <br>
    All BOs in a bulk share the same reservation object. So when you
    acquired one you can just keep the dma-resv locked even after
    evicting the BO.<br>
    <br>
    Since moving BOs requires locking the dma-resv object the whole
    problem then just boils down to a list_for_each_element_safe().<br>
    <br>
    That's probably a bit simpler than doing the add/remove dance.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">


/Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
The restartable property is used in patch 4 to restart swapout if
needed, but the main purpose is this paves the way for
shrinker- and exhaustive eviction.

Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>

Thomas Hellström (4):
&nbsp;&nbsp; drm/ttm: Allow TTM LRU list nodes of different types
&nbsp;&nbsp; drm/ttm: Use LRU hitches
&nbsp;&nbsp; drm/ttm: Consider hitch moves within bulk sublist moves
&nbsp;&nbsp; drm/ttm: Allow continued swapout after -ENOSPC falure

&nbsp; drivers/gpu/drm/ttm/ttm_bo.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
&nbsp; drivers/gpu/drm/ttm/ttm_device.c&nbsp;&nbsp; |&nbsp; 33 +++--
&nbsp; drivers/gpu/drm/ttm/ttm_resource.c | 202 +++++++++++++++++++++++-
-----
&nbsp; include/drm/ttm/ttm_resource.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 91 +++++++++++--
&nbsp; 4 files changed, 267 insertions(+), 60 deletions(-)

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------3jjBzPfZ2sKtzPi1eA02MLjj--
