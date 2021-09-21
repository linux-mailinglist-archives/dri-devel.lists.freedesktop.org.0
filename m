Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9844129D6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 02:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C180E6E8BC;
	Tue, 21 Sep 2021 00:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99576E8BB;
 Tue, 21 Sep 2021 00:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyC3NR9PGkrh6QkNJipRI7yxYZZoN32FkbQL8NDKXYLxvPs+YhKW6njnmtQXOddo1i6QnwLumJZqt8SJjF8CotsVa5rjRR6TOq2ZtYt1wMEhbNwua0CfdwCyKIMRtGlzPUbKj9qkfW7FRhjvbr81JFFohnSMwkI7Vv22rhdd95/ak0Vw/kQE/Z3iS0cNtlrcvZcEaj3HZtRbKgL/7Ap2AuL/89XUj1QnNispHMwsp2bdBVWb/qQYyoUzi0bw7sK08DvweNrIICJTPAXxx4plkgfDyGuVf60KeXitdbCW52QF/IB7mjd8LGgW+pJDblEF9Wlsek9Ro8cMR3r2xdQl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HJIt15kBu937SjMNEr7zX4p6kwrJnj3lV0jISH7ZXJc=;
 b=KTGT9pM+BUf/Z+0V2LfwfZAmD5jqJhcE44PEQ7Hnz8x8kZM9BbEYhUzAa2yNdgyQLXkr2TIzEaTPY1B5Jl/CaxV0NZ0Xmuxg5oYfH8jsZTwDfhsnVrkZsLZ5i4DOWdd8YAEqr1FD3PqvwNuKuQSmNLtURShF8Vs2kC0XfDlxep3NoUOVbz1aXjIiaGj4fhlx8dCpDaapyN4SnLCeqrMIqtLPSGhu+W8ilx+fP2AZADSRAS8MHUE6XBhXbIV+vJN/PLK+89yU3lYHGQw2vtZWaOlJjRjb0G9QH6dP9OYbsWStv2TRQYdLuUTBgPu6/I5WyYuuVXxCgwOOxWLBvJOetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJIt15kBu937SjMNEr7zX4p6kwrJnj3lV0jISH7ZXJc=;
 b=Jz2+1DbIcs8P4oCWZWV/NhddC83KD107NrtzViUnhqHLkaVTUeFM0BaDkc3yivuhqapHN71gS3cPVxOwbZ9KpxrDh3ODOCu/5V6mwR2RGYCZCHt2idEHoVTaQe6yOnXroDxYvQCTRBOT/rRTIO3qhFGJ3UWAd4XjJHrRP9w8HFo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 00:14:55 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%9]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 00:14:55 +0000
Message-ID: <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
Date: Mon, 20 Sep 2021 20:14:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sebastian@sebastianwick.net, mcasas@google.com, jshargo@google.com,
 Shashank.Sharma@amd.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210915170127.31377385@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0182.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0182.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 00:14:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0237121-ab32-46ed-fd57-08d97c94d6e8
X-MS-TrafficTypeDiagnostic: CO6PR12MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5441F4A04130B979ED0365FA8CA19@CO6PR12MB5441.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLxUKJmBb0MCaZq+ynhAZRzCiR5ywXL/sIYPsLPB10rtgo5jbwSVzas9v6aDut/r1OhZFloxZmU756sV1vwW6pRqJvo1Kd6PmzXT0WyARwACBEuy4IulAVid7Y9NivqBuAL73/8pq1bP0c8Wqzl+5hCg95AymUnwk3jB4TFXAYuJbhpvxVDZrIG8COgk/HWBWxE8rOaLXnjU6HxyP5BpqZqBNM9XJILGLryHFcn4/d+v5QNogqMp4XDLpmideOsNdCpb0dbRL8hVton0lBSsA8DMrRbGQzPOqbBdgcRr2paiPV0eokU+lkhll7ExQA7XGLUtm8t5DIADsmgwiTC4okXxuS/In/Nhu/wRncyfQg9OhD/FPUlDEiNlMSZMRd2PNbEYX4VRiCcAKfG98nFPTCv23WxPu2XbTCKFDiJ9FGCFFgbFZLMecRd2Nw/gSuBbGDhOqQUTV5t03XKsbiFO63n6H9GK6rqZ+FDHl5CcrBDLAu046RbE+fbY1djGnL7Md6V7jUJqjS0UgvuDZ51DQmr639sQkiJYjOO+DJy3NZGQn5LBFyXaTm+GEP4R0DrO8CSSCer0AEA88zhn2tMhVo+ic5haqMVcMYFxjOFP4vZwWWuaDP05slVkJDvDBsQBTWZls0pd8J50VuRu/kefufciCWsgiWLXwfIgN/idj4mtzHn/gPwI80hHMyZ3LWOf+PwaRY/ZIpJ0PIXmsAj9vgOk0H7GeJyx0SxQZei4w7AsoR4rrmkU8M5iXBL4P/h08VdLs/ShkP72tO/m2z0lB+H+xuBCIaiBJ9/5Ht59BkATzJhrk7nXriMuH5BnxcsdmWfghs9h4IjTVhQwZKg28q4FttqMWzLY0nbgrsFiVUA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(2616005)(26005)(36756003)(186003)(16576012)(8676002)(31696002)(30864003)(4326008)(31686004)(6916009)(38100700002)(6486002)(83380400001)(508600001)(966005)(86362001)(44832011)(5660300002)(316002)(8936002)(66946007)(66556008)(7416002)(2906002)(66476007)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC81VjBvMjlkWjZUTDZEeDVha09jclhFWFpoVnZqcnZBbjEwbjNyU3NLTGZX?=
 =?utf-8?B?YmRlbHh2ZkhabnlnbzQ0djZTMTdaZWlyOVBPZzN3ZDROUlJZNDVFSnlQOGF3?=
 =?utf-8?B?eGJPV0Z6Z09vN2lOVFU0MFkycnlJVXJyTWZWK2EwMGZoK1BZWGtqUTNJQjV5?=
 =?utf-8?B?elhROFJkczBlUmVHTTBPb1lqclNEeVNLMG5udUR5cHprREMvMVZ3MkwyRnF5?=
 =?utf-8?B?TW1JOE5XZDZQWHlCV1p2YXY3alRGN2kwK0p5Umt5M2xvSmZ2TVp5b3p1NjZh?=
 =?utf-8?B?NW5GbjY1Nm5oZW9aby83SHZKdFhBZVZvV2VIRUVJa29zWDN0cmpnQVRydWh4?=
 =?utf-8?B?TVZlREZpRFV3U2MyMjJKUFdpajUzTmVEWkRoSkFkUkkrQ3VoZ0ZKK3FudDd3?=
 =?utf-8?B?K0hyLzhENmdqZUpxMWVCSWdRV05NdTM0MGJtZnY4V2FSQURSZGdBMTA3ZjdR?=
 =?utf-8?B?S1YxYi9NUHEzdlYzTDBwS1NQZE1MWUV3TDBXNXpLUDRGcTg5VExoaXA4eFZL?=
 =?utf-8?B?cEdEVllaNVV0ay8zcTB4Nmd3V0RNYW93WDUxck0xQVQyc0VORm5Bc05xSlVD?=
 =?utf-8?B?UysrcUVNQ0t2UXJySTJ6QUtHYVZOdWRYUys4QWdTQ3FKVlBQVVVab3BoTWNM?=
 =?utf-8?B?dzF0Y2NhVEUzZFQreitwWVVyYnpBNm5ZcFM5M3JZaXZVRUVuY29YSzFFVHpp?=
 =?utf-8?B?UXVVTFhHdDBBRjZaR3lDWWh3azNKKzJVbERQWVFhODkrUTRTcW5veXVnbzFv?=
 =?utf-8?B?UHNsZFFqSUczYnlvQSt1MmY0ZjgxYm1GL04rSHNmbEF6U0JVSUJ1YlowMXo0?=
 =?utf-8?B?NEJtQlpoWEtZSVplZmU4QUNjRENnVDJ4VkhnZ0U3WUZ3RHoycTV1VUJzY2E0?=
 =?utf-8?B?cWRsUExhLzhYR0h1SW9mYjBqSWNycVlZSFRZZkd0dW9GbHpCNGtaRzJ1bVBl?=
 =?utf-8?B?aytpRCtGNmVqaTJDVXl4cThPM2tiekljOTc5a1g3NjJPZzUzbGpLS3dWdVJF?=
 =?utf-8?B?dmVGMmJkRVd3ajlxTHVhVjcvYmtyZFJkbVNSbVJzUkdOQXlEV1FnZ25teGxr?=
 =?utf-8?B?Qkprbk5SZ3RDYUNVYkl0emtKd3psRU1VR2l2cnJodlp3RGQrZGhHcnRMUlVs?=
 =?utf-8?B?b2l3THBiMmpKL0k5S2FlWHU4aEF1RjhpRTlsUGo4akFneFVkRThobXE2cGUr?=
 =?utf-8?B?bXpaQ1BhUWtlUkVNanhpaFpKemRvT29zelA0a1dqWlZGcElXcGh0WklyN0E0?=
 =?utf-8?B?bXJ1TkxCcU1uT3pJREloYUdWQldvTU03WTBTcFZ3aVAxbHpuaVJYeGdaU3BQ?=
 =?utf-8?B?bnJ5bXdWWHpOempSeFB2UTMzK0dZbEF5WElxWnVYRHBGWDZKcTlpRTRjemQx?=
 =?utf-8?B?MVlhdHo2TVZOVkhXV01Ed0tRTSswVmxIdmlPd1Zwa2ZnZWZ3VmZJWWsrRXM1?=
 =?utf-8?B?WVhycFlMVXJLMDl0RGI5QmNwY0g2S3k2KzRPTmdRMlNBeXg2cWR6bFBBLzcy?=
 =?utf-8?B?NmJrZ1QyKzR5Tm13SXJwL2R6YWlMamhQdVpCaGJGempsWWNVcFY4K1JvTTJp?=
 =?utf-8?B?bVg0TkcrNFFVNWpwcW16QnpNVm1SMHNJazFxSXFGZXkya3JRRzRwdUw4eVdR?=
 =?utf-8?B?R3FaWmpET3pFZERKTUhGTG03ZXFrdzIrRk5hR0FJSGE3Z0ZsN1MrUmRMQVpp?=
 =?utf-8?B?R2VDSEdtK2NqSlpqRVVLdUVvK2Flc1I2bE1ZNzZYMkFGcnZVQitJdXdSbDll?=
 =?utf-8?Q?E4mPZ0E9SVilc9PrT4fDd4fZLxQpufOoBtdZ1i0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0237121-ab32-46ed-fd57-08d97c94d6e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 00:14:55.5638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ch/79IBORBROOeCnkPbSTfl3I/oUFuV8iYvsfC4NXwS/yKZjM9FGUcDEaCttcJMLz3qlszs4bThKOUZ1w2ct3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441
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

On 2021-09-15 10:01, Pekka Paalanen wrote:> On Fri, 30 Jul 2021 16:41:29 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> Use the new DRM RFC doc section to capture the RFC previously only
>> described in the cover letter at
>> https://patchwork.freedesktop.org/series/89506/
>>
>> v3:
>>  * Add sections on single-plane and multi-plane HDR
>>  * Describe approach to define HW details vs approach to define SW intentions
>>  * Link Jeremy Cline's excellent HDR summaries
>>  * Outline intention behind overly verbose doc
>>  * Describe FP16 use-case
>>  * Clean up links
>>
>> v2: create this doc
>>
>> v1: n/a
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> 
> Hi Harry,
> 
> I finally managed to go through this, comments below. Excellent to have
> pictures included. I wrote this reply over several days, sorry if it's
> not quite coherent.
> 

Hi Pekka,

Thanks for taking the time to go through this.

My reply is also a multi-day endeavor (due to other interruptions) so
please bear with me as well if it looks a bit disjointed in places.

> 
>> ---
>>  Documentation/gpu/rfc/color_intentions.drawio |   1 +
>>  Documentation/gpu/rfc/color_intentions.svg    |   3 +
>>  Documentation/gpu/rfc/colorpipe               |   1 +
>>  Documentation/gpu/rfc/colorpipe.svg           |   3 +
>>  Documentation/gpu/rfc/hdr-wide-gamut.rst      | 580 ++++++++++++++++++
>>  Documentation/gpu/rfc/index.rst               |   1 +
>>  6 files changed, 589 insertions(+)
>>  create mode 100644 Documentation/gpu/rfc/color_intentions.drawio
>>  create mode 100644 Documentation/gpu/rfc/color_intentions.svg
>>  create mode 100644 Documentation/gpu/rfc/colorpipe
>>  create mode 100644 Documentation/gpu/rfc/colorpipe.svg
>>  create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst
> 
> ...
> 
>> diff --git a/Documentation/gpu/rfc/hdr-wide-gamut.rst b/Documentation/gpu/rfc/hdr-wide-gamut.rst
>> new file mode 100644
>> index 000000000000..e463670191ab
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/hdr-wide-gamut.rst
>> @@ -0,0 +1,580 @@
>> +==============================
>> +HDR & Wide Color Gamut Support
>> +==============================
>> +
>> +.. role:: wy-text-strike
>> +
>> +ToDo
>> +====
>> +
>> +* :wy-text-strike:`Reformat as RST kerneldoc` - done
>> +* :wy-text-strike:`Don't use color_encoding for color_space definitions` - done
>> +* :wy-text-strike:`Update SDR luminance description and reasoning` - done
>> +* :wy-text-strike:`Clarify 3D LUT required for some color space transformations` - done
>> +* :wy-text-strike:`Highlight need for named color space and EOTF definitions` - done
>> +* :wy-text-strike:`Define transfer function API` - done
>> +* :wy-text-strike:`Draft upstream plan` - done
>> +* :wy-text-strike:`Reference to wayland plan` - done
>> +* Reference to Chrome plans
>> +* Sketch view of HW pipeline for couple of HW implementations
>> +
>> +
>> +Upstream Plan
>> +=============
>> +
>> +* Reach consensus on DRM/KMS API
>> +* Implement support in amdgpu
>> +* Implement IGT tests
>> +* Add API support to Weston, ChromiumOS, or other canonical open-source project interested in HDR
>> +* Merge user-space
>> +* Merge kernel patches
> 
> The order is: review acceptance of userspace but don't merge, merge
> kernel, merge userspace.
> 
Updated for v4

>> +
>> +
>> +History
>> +=======
>> +
>> +v3:
>> +
>> +* Add sections on single-plane and multi-plane HDR
>> +* Describe approach to define HW details vs approach to define SW intentions
>> +* Link Jeremy Cline's excellent HDR summaries
>> +* Outline intention behind overly verbose doc
>> +* Describe FP16 use-case
>> +* Clean up links
>> +
>> +v2: create this doc
>> +
>> +v1: n/a
>> +
>> +
>> +Introduction
>> +============
>> +
>> +We are looking to enable HDR support for a couple of single-plane and
>> +multi-plane scenarios. To do this effectively we recommend new interfaces
>> +to drm_plane. Below I'll give a bit of background on HDR and why we
>> +propose these interfaces.
>> +
>> +As an RFC doc this document is more verbose than what we would want from
>> +an eventual uAPI doc. This is intentional in order to ensure interested
>> +parties are all on the same page and to facilitate discussion if there
>> +is disagreement on aspects of the intentions behind the proposed uAPI.
> 
> I would recommend keeping the discussion parts of the document as well,
> but if you think they hurt the readability of the uAPI specification,
> then split things into normative and informative sections.
> 
Good point. Let me think how to organize this in a way that preserves
readability of the spec and also preserves (key) discussions for
posterity. The history behind an API can often be more informative than
the API doc itself.

>> +
>> +
>> +Overview and background
>> +=======================
>> +
>> +I highly recommend you read `Jeremy Cline's HDR primer`_
>> +
>> +Jeremy Cline did a much better job describing this. I highly recommend
>> +you read it at [1]:
>> +
>> +.. _Jeremy Cline's HDR primer: https://www.jcline.org/blog/fedora/graphics/hdr/2021/05/07/hdr-in-linux-p1.html
> 
> That's a nice write-up I didn't know about, thanks.
> 
> I just wish such write-ups would be somehow peer-reviewed for
> correctness and curated for proper referencing. Perhaps like we develop
> code: at least some initial peer review and then fixes when anyone
> notices something to improve. Like... what you are doing here! :-)
> 
> The post is perhaps a bit too narrow with OETF/EOTF terms, accidentally
> implying that OETF = EOTF^-1 which is not generally true, but that all
> depends on which O-to-E or E-to-O functions one is talking about.
> Particularly there is a difference between functions used for signal
> compression which needs an exact matching inverse function, and
> functions containing tone-mapping and artistic effects that when
> concatenated result in the (non-identity) OOTF.
> 
> Nothing in the post seems to disagree with my current understanding
> FWI'mW.
> 
>> +
>> +Defining a pixel's luminance
>> +----------------------------
>> +
>> +The luminance space of pixels in a framebuffer/plane presented to the
>> +display is not well defined in the DRM/KMS APIs. It is usually assumed to
>> +be in a 2.2 or 2.4 gamma space and has no mapping to an absolute luminance
>> +value; it is interpreted in relative terms.
>> +
>> +Luminance can be measured and described in absolute terms as candela
>> +per meter squared, or cd/m2, or nits. Even though a pixel value can be
>> +mapped to luminance in a linear fashion to do so without losing a lot of
>> +detail requires 16-bpc color depth. The reason for this is that human
>> +perception can distinguish roughly between a 0.5-1% luminance delta. A
>> +linear representation is suboptimal, wasting precision in the highlights
>> +and losing precision in the shadows.
>> +
>> +A gamma curve is a decent approximation to a human's perception of
>> +luminance, but the `PQ (perceptual quantizer) function`_ improves on
>> +it. It also defines the luminance values in absolute terms, with the
>> +highest value being 10,000 nits and the lowest 0.0005 nits.
>> +
>> +Using a content that's defined in PQ space we can approximate the real
>> +world in a much better way.
> 
> Or HLG. It is said that HLG puts the OOTF in the display, while in a PQ
> system OOTF is baked into the transmission. However, a monitor that
> consumes PQ will likely do some tone-mapping to fit it to the display
> capabilities, so it is adding an OOTF of its own. In a HLG system I
> would think artistic adjustments are done before transmission baking
> them in, adding its own OOTF in addition to the sink OOTF. So both
> systems necessarily have some O-O mangling on both sides of
> transmission.
> 
> There is a HLG presentation at
> https://www.w3.org/Graphics/Color/Workshop/talks.html#intro
> 
Thanks for sharing. I spent some time on Friday to watch them all
and found them very informative, especially the HLG talk and the
talk about linear vs composited HDR pipelines.

>> +
>> +Here are some examples of real-life objects and their approximate
>> +luminance values:
>> +
>> +
>> +.. _PQ (perceptual quantizer) function: https://en.wikipedia.org/wiki/High-dynamic-range_video#Perceptual_Quantizer
>> +
>> +.. flat-table::
>> +   :header-rows: 1
>> +
>> +   * - Object
>> +     - Luminance in nits
>> +
>> +   *  - Fluorescent light
>> +      - 10,000
>> +
>> +   *  - Highlights
>> +      - 1,000 - sunlight
> 
> Did fluorescent and highlights get swapped here?
> 
No, though at first glance it can look like that. This is pulled
from an internal doc I didn't write, but I think the intention is
to show that fluorescent lights can be up to 10,000 nits and
highlights are usually 1,000+ nits.

I'll clarify this in v4.

A quick google search seems to show that there are even fluorescent
lights with 46,000 nits. I guess these numbers provide a ballpark
view more than anything.

>> +
>> +   *  - White Objects
>> +      - 250 - 1,000
>> +
>> +   *  - Typical Objects
>> +      - 1 - 250
>> +
>> +   *  - Shadows
>> +      - 0.01 - 1
>> +
>> +   *  - Ultra Blacks
>> +      - 0 - 0.0005
>> +
>> +
>> +Transfer functions
>> +------------------
>> +
>> +Traditionally we used the terms gamma and de-gamma to describe the
>> +encoding of a pixel's luminance value and the operation to transfer from
>> +a linear luminance space to the non-linear space used to encode the
>> +pixels. Since some newer encodings don't use a gamma curve I suggest
>> +we refer to non-linear encodings using the terms `EOTF, and OETF`_, or
>> +simply as transfer function in general.
> 
> Yeah, gamma could mean lots of things. If you have e.g. OETF gamma
> 1/2.2 and EOTF gamma 2.4, the result is OOTF gamma 1.09.
> 
> OETF, EOTF and OOTF are not unambiguous either, since there is always
> the question of whose function is it.
> 
Yeah, I think both gamma and EO/OE/OO/EETF are all somewhat problematic.

I tend to think about these more in terms of input and output transfer
functions but then you have the ambiguity about what your input and
output mean. I see the input TF between framebuffer and blender,
and the output TF between blender and display.

You also have the challenge that input and output transfer functions
fulfill multiple roles, e.g. an output transfer as defined above might do
linear-to-PQ conversion but could also fill the role of tone mapping
in the case where the input content spans a larger range than the
display space.

> Two different EOTFs are of interest in composition for display:
> - the display EOTF (since display signal is electrical)
> - the content EOTF (since content is stored in electrical encoding)
> 
> 
>> +
>> +The EOTF (Electro-Optical Transfer Function) describes how to transfer
>> +from an electrical signal to an optical signal. This was traditionally
>> +done by the de-gamma function.
>> +
>> +The OETF (Opto Electronic Transfer Function) describes how to transfer
>> +from an optical signal to an electronic signal. This was traditionally
>> +done by the gamma function.
>> +
>> +More generally we can name the transfer function describing the transform
>> +between scanout and blending space as the **input transfer function**, and
> 
> "scanout space" makes me think of cable/signal values, not framebuffer
> values. Or, I'm not sure. I'd recommend replacing the term "scanout
> space" with something less ambiguous like framebuffer values.
> 
Framebuffer space/values is much better than scanout space.

>> +the transfer function describing the transform from blending space to the
>> +output space as **output transfer function**.
> 
> You're talking about "spaces" here, but what you are actually talking
> about are value encodings, not (color) spaces. An EOTF or OETF is not
> meant to modify the color space.
> 
> When talking about blending, what you're actually interested in is
> linear vs. non-linear color value encoding. This matches your talk
> about EOTF and OETF, although you need to be careful to specify which
> EOTF and OETF you mean. For blending, color values need to be linear in
> light intensity, and the inverse of the E-to-O mapping before blending
> is exactly the same as the O-to-E mapping after blending. Otherwise you
> would alter even opaque pixels.
> 
I struggle a bit with finding the right term to talk about color value
encoding in general. Concrete examples can be PQ-encoded, Gamma 2.2, or
linearly encoded spaces but I was grasping for a more general term;
something that could potentially include TFs that also tone-map.

Interestingly, the Canvas API changes presented by Christopher Cameron
also seem to use the new colorSpace property to deal with both color
space, as well as EOTF.

https://www.youtube.com/watch?v=fHbLbVacYw4

> OETF is often associated with cameras, not displays. Maybe use EOTF^-1
> instead?
> 
Good point. Fixed for v4.

> Btw. another terminology thing: color space vs. color model. RGB and
> YCbCr are color models. sRGB, BT.601 and BT.2020 are color spaces.
> These two are orthogonal concepts.
> 
Thanks for clarifying.

>> +
>> +
>> +.. _EOTF, and OETF: https://en.wikipedia.org/wiki/Transfer_functions_in_imaging
>> +
>> +Mastering Luminances
>> +--------------------
>> +
>> +Even though we are able to describe the absolute luminance of a pixel
>> +using the PQ 2084 EOTF we are presented with physical limitations of the
>> +display technologies on the market today. Here are a few examples of
>> +luminance ranges of displays.
>> +
>> +.. flat-table::
>> +   :header-rows: 1
>> +
>> +   * - Display
>> +     - Luminance range in nits
>> +
>> +   *  - Typical PC display
>> +      - 0.3 - 200
>> +
>> +   *  - Excellent LCD HDTV
>> +      - 0.3 - 400
>> +
>> +   *  - HDR LCD w/ local dimming
>> +      - 0.05 - 1,500
>> +
>> +Since no display can currently show the full 0.0005 to 10,000 nits
>> +luminance range of PQ the display will need to tone-map the HDR content,
>> +i.e to fit the content within a display's capabilities. To assist
>> +with tone-mapping HDR content is usually accompanied by a metadata
>> +that describes (among other things) the minimum and maximum mastering
>> +luminance, i.e. the maximum and minimum luminance of the display that
>> +was used to master the HDR content.
>> +
>> +The HDR metadata is currently defined on the drm_connector via the
>> +hdr_output_metadata blob property.
> 
> HDR_OUTPUT_METADATA, all caps.
> 
>> +
>> +It might be useful to define per-plane hdr metadata, as different planes
>> +might have been mastered differently.
>> +
>> +.. _SDR Luminance:
>> +
>> +SDR Luminance
>> +-------------
>> +
>> +Traditional SDR content's maximum white luminance is not well defined.
>> +Some like to define it at 80 nits, others at 200 nits. It also depends
>> +to a large extent on the environmental viewing conditions. In practice
>> +this means that we need to define the maximum SDR white luminance, either
>> +in nits, or as a ratio.
>> +
>> +`One Windows API`_ defines it as a ratio against 80 nits.
>> +
>> +`Another Windows API`_ defines it as a nits value.
>> +
>> +The `Wayland color management proposal`_ uses Apple's definition of EDR as a
>> +ratio of the HDR range vs SDR range.
>> +
>> +If a display's maximum HDR white level is correctly reported it is trivial
>> +to convert between all of the above representations of SDR white level. If
>> +it is not, defining SDR luminance as a nits value, or a ratio vs a fixed
>> +nits value is preferred, assuming we are blending in linear space.
>> +
>> +It is our experience that many HDR displays do not report maximum white
>> +level correctly
> 
> Which value do you refer to as "maximum white", and how did you measure
> it?
> 
Good question. I haven't played with those displays myself but I'll try to
find out a bit more background behind this statement.

> You also need to define who is "us" since kernel docs tend to get lots
> of authors over time.
> 
Good point. Changed in v4

> 
>> +
>> +.. _One Windows API: https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/dispmprt/ns-dispmprt-_dxgkarg_settargetadjustedcolorimetry2
>> +.. _Another Windows API: https://docs.microsoft.com/en-us/uwp/api/windows.graphics.display.advancedcolorinfo.sdrwhitelevelinnits?view=winrt-20348
>> +.. _Wayland color management proposal: https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst#id8
>> +
>> +Let There Be Color
>> +------------------
>> +
>> +So far we've only talked about luminance, ignoring colors altogether. Just
>> +like in the luminance space, traditionally the color space of display
>> +outputs has not been well defined. Similar to how an EOTF defines a
>> +mapping of pixel data to an absolute luminance value, the color space
>> +maps color information for each pixel onto the CIE 1931 chromaticity
>> +space. This can be thought of as a mapping to an absolute, real-life,
>> +color value.
>> +
>> +A color space is defined by its primaries and white point. The primaries
>> +and white point are expressed as coordinates in the CIE 1931 color
>> +space. Think of the red primary as the reddest red that can be displayed
>> +within the color space. Same for green and blue.
>> +
>> +Examples of color spaces are:
>> +
>> +.. flat-table::
>> +   :header-rows: 1
>> +
>> +   * - Color Space
>> +     - Description
>> +
>> +   *  - BT 601
>> +      - similar to BT 709
>> +
>> +   *  - BT 709
>> +      - used by sRGB content; ~53% of BT 2020
>> +
>> +   *  - DCI-P3
>> +      - used by most HDR displays; ~72% of BT 2020
>> +
>> +   *  - BT 2020
>> +      - standard for most HDR content
>> +
>> +
>> +
>> +Color Primaries and White Point
>> +-------------------------------
>> +
>> +Just like displays can currently not represent the entire 0.0005 -
>> +10,000 nits HDR range of the PQ 2084 EOTF, they are currently not capable
> 
> "PQ" or "ST 2084".
> 
Fixed in v4

>> +of representing the entire BT.2020 color Gamut. For this reason video
>> +content will often specify the color primaries and white point used to
>> +master the video, in order to allow displays to be able to map the image
>> +as best as possible onto the display's gamut.
>> +
>> +
>> +Displays and Tonemapping
>> +------------------------
>> +
>> +External displays are able to do their own tone and color mapping, based
>> +on the mastering luminance, color primaries, and white space defined in
>> +the HDR metadata.
> 
> HLG does things differently wrt. metadata and tone-mapping than PQ.
> 
As mentioned above I had some time to watch the HLG presentation and that
indeed has interesting implications. With HLG we also have relative luminance
HDR content. One challenge is How to tone-map HLG content alongside SDR (sRGB)
content and PQ content.

I think ultimately this means that we can't rely on display tonemapping when
we are dealing with mixed content on the screen. In that case we would probably
want to output to the display in the EDID-referred space and tone-map all incoming
buffers to the EDID-referred space.

I think the doc needs a lot more pictures. I wonder if I can do that without
polluting git with large files.

>> +
>> +Some internal panels might not include the complex HW to do tone and color
>> +mapping on their own and will require the display driver to perform
>> +appropriate mapping.
>> +
>> +
>> +How are we solving the problem?
>> +===============================
>> +
>> +Single-plane
>> +------------
>> +
>> +If a single drm_plane is used no further work is required. The compositor
>> +will provide one HDR plane alongside a drm_connector's hdr_output_metadata
>> +and the display HW will output this plane without further processing if
>> +no CRTC LUTs are provided.
>> +
>> +If desired a compositor can use the CRTC LUTs for HDR content but without
>> +support for PWL or multi-segmented LUTs the quality of the operation is
>> +expected to be subpar for HDR content.
> 
> Explain/expand PWL.
> 

Updated in v4.

> Do you have references to these subpar results? I'm interested in when
> and how they appear. I may want to use that information to avoid using
> KMS LUTs when they are inadequate.
> 
I don't have any actual results or data to back up this statement at
this point.

> 
>> +
>> +
>> +Multi-plane
>> +-----------
>> +
>> +In multi-plane configurations we need to solve the problem of blending
>> +HDR and SDR content. This blending should be done in linear space and
>> +therefore requires framebuffer data that is presented in linear space
>> +or a way to convert non-linear data to linear space. Additionally
>> +we need a way to define the luminance of any SDR content in relation
>> +to the HDR content.
>> +
>> +In order to present framebuffer data in linear space without losing a
>> +lot of precision it needs to be presented using 16 bpc precision.
> 
> Integer or floating-point?
> 
Floating point. Fixed in v4.

I doubt integer would work since we'd lose too much precision in the dark
areas. Though, maybe 16-bit would let us map those well enough? I don't know
for sure. Either way, I think anybody doing linear is using FP16.

> 
>> +
>> +
>> +Defining HW Details
>> +-------------------
>> +
>> +One way to take full advantage of modern HW's color pipelines is by
>> +defining a "generic" pipeline that matches all capable HW. Something
>> +like this, which I took `from Uma Shankar`_ and expanded on:
>> +
>> +.. _from Uma Shankar: https://patchwork.freedesktop.org/series/90826/
>> +
>> +.. kernel-figure::  colorpipe.svg
> 
> Btw. there will be interesting issues with alpha-premult, filtering,
> and linearisation if your planes have alpha channels. That's before
> HDR is even considered.
> 
Could you expand on this a bit?
>> +
>> +I intentionally put de-Gamma, and Gamma in parentheses in my graph
>> +as they describe the intention of the block but not necessarily a
>> +strict definition of how a userspace implementation is required to
>> +use them.
>> +
>> +De-Gamma and Gamma blocks are named LUT, but they could be non-programmable
>> +LUTs in some HW implementations with no programmable LUT available. See
>> +the definitions for AMD's `latest dGPU generation`_ as an example.
>> +
>> +.. _latest dGPU generation: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c?h=v5.13#n2586
>> +
>> +I renamed the "Plane Gamma LUT" and "CRTC De-Gamma LUT" to "Tonemapping"
>> +as we generally don't want to re-apply gamma before blending, or do
>> +de-gamma post blending. These blocks tend generally to be intended for
>> +tonemapping purposes.
> 
> Right.
> 
>> +
>> +Tonemapping in this case could be a simple nits value or `EDR`_ to describe
>> +how to scale the :ref:`SDR luminance`.
> 
> I do wonder how that will turn out in the end... but on Friday there
> will be HDR Compositing and Tone-mapping live Q&A session:
> https://www.w3.org/Graphics/Color/Workshop/talks.html#compos
> 
I didn't manage to join the compositing and tone-mapping live Q&A? Did
anything interesting emerge from that?

I've watched Timo Kunkel's talk and it's been very eye opening. He does
a great job of highlighting the challenges of compositing HDR content.

>> +
>> +Tonemapping could also include the ability to use a 3D LUT which might be
>> +accompanied by a 1D shaper LUT. The shaper LUT is required in order to
>> +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) operates
>> +in perceptual (non-linear) space, so as to evenly spread the limited
>> +entries evenly across the perceived space.
>> +
>> +.. _EDR: https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst#id8
>> +
>> +Creating a model that is flexible enough to define color pipelines for
>> +a wide variety of HW is challenging, though not impossible. Implementing
>> +support for such a flexible definition in userspace, though, amounts
>> +to essentially writing color pipeline drivers for each HW.
> 
> My thinking right now is that userspace has it's own pipeline model
> with the elements it must have. Then it attempts to map that pipeline
> to what elements the KMS pipeline happens to expose. If there is a
> mapping, good. If not, fall back to shaders on GPU.
> > To help that succeed more often, I'm using the current KMS abstract
> pipeline as a guide in designing the Weston internal color pipeline.
> 
I feel I should know, but is this pipeline documented? Is it merely, the
plane > crtc > connector model, or does it go beyond that?

>> +
>> +
>> +Defining SW Intentions
>> +----------------------
>> +
>> +An alternative to describing the HW color pipeline in enough detail to
>> +be useful for color management and HDR purposes is to instead define
>> +SW intentions.
>> +
>> +.. kernel-figure::  color_intentions.svg
>> +
>> +This greatly simplifies the API and lets the driver do what a driver
>> +does best: figure out how to program the HW to achieve the desired
>> +effect.
>> +
>> +The above diagram could include white point, primaries, and maximum
>> +peak and average white levels in order to facilitate tone mapping.
>> +
>> +At this point I suggest to keep tonemapping (other than an SDR luminance
>> +adjustment) out of the current DRM/KMS API. Most HDR displays are capable
>> +of tonemapping. If for some reason tonemapping is still desired on
>> +a plane, a shader might be a better way of doing that instead of relying
>> +on display HW.
> 
> "Non-programmable LUT" as you referred to them is an interesting
> departure from the earlier suggestion, where you intended to describe
> color spaces and encodings of content and display and let the hardware
> do whatever wild magic in between. Now it seems like you have shifted
> to programming transformations instead. They may be programmable or
> enumerated, but still transformations rather than source and
> destination descriptions. If the enumerated transformations follow
> standards, even better.
> 
> I think this is a step in the right direction.
> > However, you wrote in the heading "Intentions" which sounds like your
> old approach.
> 
> Conversion from one additive linear color space to another is a matter
> of matrix multiplication. That is simple and easy to define, just load a
> matrix. The problem is gamut mapping: you may end up outside of the
> destination gamut, or maybe you want to use more of the destination
> gamut than what the color space definitions imply. There are many
> conflicting goals and ways to this, and I suspect the room for secret
> sauce is here (and in tone-mapping).
> 
> There is also a difference between color space (signal) gamut and
> device gamut. A display may accept BT.2020 signal, but the gamut it can
> show is usually much less.
> 
True.

> 
>> +
>> +In some ways this mirrors how various userspace APIs treat HDR:
>> + * Gstreamer's `GstVideoTransferFunction`_
>> + * EGL's `EGL_EXT_gl_colorspace_bt2020_pq`_ extension
>> + * Vulkan's `VkColorSpaceKHR`_
>> +
>> +.. _GstVideoTransferFunction: https://gstreamer.freedesktop.org/documentation/video/video-color.html?gi-language=c#GstVideoTransferFunction
>> +.. _EGL_EXT_gl_colorspace_bt2020_pq: https://www.khronos.org/registry/EGL/extensions/EXT/EGL_EXT_gl_colorspace_bt2020_linear.txt
>> +.. _VkColorSpaceKHR: https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkColorSpaceKHR
>> +
>> +
>> +A hybrid approach to the API
>> +----------------------------
>> +
>> +Our current approach attempts a hybrid approach, defining API to specify
>> +input and output transfer functions, as well as an SDR boost, and a
>> +input color space definition.
> 
> Using a color space definition in the KMS UAPI brings us back to the
> old problem.
> 
> Using descriptions of content (color spaces) instead of prescribing
> transformations seems to be designed to allow vendors make use of their
> secret hardware sauce: how to best realise the intent. Since it is
> secret sauce, by definition it cannot be fully replicated in software
> or shaders. One might even get sued for succeeding.
> 
> General purpose (read: desktop) compositors need to adapt to any
> scenegraph and they want to make the most of the hardware under all
> situations. This means that it is not possible to guarantee that a
> certain window is always going to be using a KMS plane. Maybe a small
> change in the scenegraph, a moving window or cursor, suddenly causes
> the KMS plane to become unsuitable for the window, or in the opposite
> case the KMS plane suddenly becomes available for the window. This
> means that a general purpose compositor will be doing frame-by-frame
> decisions on which window to put on which KMS plane, and which windows
> need to be composited with shaders.
> 
> Not being able to replicate what the hardware does means that shaders
> cannot produce the same image on screen as the KMS plane would. When
> KMS plane assignments change, the window appearance would change as
> well. I imagine end users would be complaining of such glitches.
> 
I see your point.

> However, there are other use cases where I can imagine this descriptive
> design working perfectly. Any non-general, non-desktop compositor, or a
> closed system, could probably guarantee that the scenegraph will always
> map in a specific way to the KMS planes. The window would always map to
> the KMS plane, meaning that it would never need to be composited with
> shaders, and therefore cannot change color unexpectedly from end user
> point of view. TVs, set-top-boxes, etc., maybe even phones. Some use
> cases have a hard requirement of putting a specific window on a
> specific KMS plane, or the system simply cannot display it
> (performance, protection...).
> 
> Is it worth having two fundamentally different KMS UAPIs for HDR
> composition support, where one interface supports only a subset of use
> cases and the other (per-plane LUT, CTM, LUT, and more, freely
> programmable by userspace) supports all use cases?
> 
> That's a genuine question. Are the benefits worth the kernel
> developers' efforts to design, implement, and forever maintain both
> mutually exclusive interfaces?
> 
Tbh, I'm personally less interested in use-cases where specific windows
always map to a KMS plane. From an AMD HW point of view we can't really
guarantee that a KMS plane is always available in most scenarios. So this
would have to work for a general desktop compositor scenario where KMS
plane usage could change frame to frame.

> 
> Now, someone might say that the Wayland protocol design for HDR aims to
> be descriptive and not prescriptive, so why should KMS UAPI be
> different? The reason is explained above: *some* KMS clients may switch
> frame by frame between KMS and shaders, but Wayland clients pick one
> path and stick to it. Wayland clients have no reason that I can imagine
> to switch arbitrarily in flight.
> 
I'm a bit confused about this paragraph. Wouldn't the Wayland compositor
decide whether to use a KMS plane or shader and not the client?

>> +
>> +We would like to solicit feedback and encourage discussion around the
>> +merits and weaknesses of these approaches. This question is at the core
>> +of defining a good API and we'd like to get it right.
>> +
>> +
>> +Input and Output Transfer functions
>> +-----------------------------------
>> +
>> +We define an input transfer function on drm_plane to describe the
>> +transform from framebuffer to blending space.
>> +
>> +We define an output transfer function on drm_crtc to describe the
>> +transform from blending space to display space.
>> +
> 
> Here is again the terminology problem between transfer function and
> (color) space.
> 
Color value encoding? Or luminance space? Or maybe there's a different term
altogether to describe this?

>> +The transfer function can be a pre-defined function, such as PQ EOTF, or
>> +a custom LUT. A driver will be able to specify support for specific
>> +transfer functions, including custom ones.
> 
> This sounds good.
> 
>> +
>> +Defining the transfer function in this way allows us to support in on HW
>> +that uses ROMs to support these transforms, as well as on HW that use
>> +LUT definitions that are complex and don't map easily onto a standard LUT
>> +definition.
>> +
>> +We will not define per-plane LUTs in this patchset as the scope of our
>> +current work only deals with pre-defined transfer functions. This API has
>> +the flexibility to add custom 1D or 3D LUTs at a later date.
> 
> Ok.
> 
>> +
>> +In order to support the existing 1D de-gamma and gamma LUTs on the drm_crtc
>> +we will include a "custom 1D" enum value to indicate that the custom gamma and
>> +de-gamma 1D LUTs should be used.
> 
> Sounds fine.
> 
>> +
>> +Possible transfer functions:
>> +
>> +.. flat-table::
>> +   :header-rows: 1
>> +
>> +   * - Transfer Function
>> +     - Description
>> +
>> +   *  - Gamma 2.2
>> +      - a simple 2.2 gamma function
>> +
>> +   *  - sRGB
>> +      - 2.4 gamma with small initial linear section
> 
> Maybe rephrase to: The piece-wise sRGB transfer function with the small
> initial linear section, approximately corresponding to 2.4 gamma
> function.
> 
> I recall some debate, too, whether with a digital flat panel you should
> use a pure 2.4 gamma function or the sRGB function. (Which one do
> displays expect?)
> 
Updated in v4.

>> +
>> +   *  - PQ 2084
>> +      - SMPTE ST 2084; used for HDR video and allows for up to 10,000 nit support
> 
> Perceptual Quantizer (PQ), or ST 2084. There is no PQ 2084.
> 
Fixed in v4

>> +
>> +   *  - Linear
>> +      - Linear relationship between pixel value and luminance value
>> +
>> +   *  - Custom 1D
>> +      - Custom 1D de-gamma and gamma LUTs; one LUT per color
>> +
>> +   *  - Custom 3D
>> +      - Custom 3D LUT (to be defined)
> 
> Adding HLG transfer function to this set would be interesting, because
> it requires a parameter I believe. How would you handle parameterised
> transfer functions?
> 
Good question. I haven't really explored HLG so far but it looks like
it's important to arrive at a sensible design.

> It's worth to note that while PQ is absolute in luminance (providing
> cd/m² values), everything else here is relative for both SDR and HDR.
> You cannot blend content in PQ with content in something else together,
> until you practically define the absolute luminance for all non-PQ
> content or vice versa.
> 
> A further complication is that you could have different
> relative-luminance transfer functions, meaning that the (absolute)
> luminance they are relative to varies. The obvious case is blending SDR
> content with HDR content when both have relative-luminance transfer
> function.
> 
Good points. It sounds like we would need something akin to EDR (or
max-SDR nits) for any relative-luminance TF, i.e. a way to arbitrarily
scale the luminance of the respective plane.

> Then you have HLG which is more like scene-referred than
> display-referred, but that might be solved with the parameter I
> mentioned, I'm not quite sure.
> 
> PQ is said to be display-referred, but it's usually referred to
> someone else's display than yours, which means it needs the HDR
> metadata to be able to tone-map suitably to your display. This seems to
> be a similar problem as with signal gamut vs. device gamut.
> 
> The traditional relative-luminance transfer functions, well, the
> content implied by them, is display-referred when it arrived at KMS or
> compositor level. There the question of "whose display" doesn't matter
> much because it's SDR and narrow gamut, and we probably don't even
> notice when we see an image wrong. With HDR the mismatch might be
> noticeable.
> 
> 
>> +
>> +
>> +Describing SDR Luminance
>> +------------------------------
>> +
>> +Since many displays do no correctly advertise the HDR white level we
>> +propose to define the SDR white level in nits.
> 
> This means that even if you had no content using PQ, you still need to
> define the absolute luminance for all the (HDR) relative-luminance
> transfer functions.
> 
> There probably needs to be something to relate everything to a single,
> relative or absolute, luminance range. That is necessary for any
> composition (KMS and software) since the output is a single image.
> 
> Is it better to go with relative or absolute metrics? Right now I would
> tend to say relative, because relative is unitless. Absolute values are
> numerically equivalent, but they might not have anything to do with
> actual physical measurements, making them actually relative. This
> happens when your monitor does not support PQ mode or does tone-mapping
> to your image, for instance.
> 
It sounds like PQ is the outlier here in defining luminance in absolute
units. Though it's also currently the most commonly used TF for HDR
content.

Wouldn't you use the absolute luminance definition for PQ if you relate
everything to a relative range?

Would it make sense to relate everything to a common output luminance
range? If that output is PQ then an input PQ buffer is still output
as PQ and relative-luminance buffers can be scaled.

Would that scaling (EDR or similar) be different for SDR (sRGB) content
vs other HDR relative-luminance content?

> The concept we have played with in Wayland so far is EDR, but then you
> have the question of "what does zero mean", i.e. the luminance of
> darkest black could vary between contents as well, not just the
> luminance of extreme white.
> 
This is a good question. For AMD HW we have a way to scaled SDR content
but I don't think that includes an ability to set the black point (unless
you go and define a LUT for it).

>> +
>> +We define a new drm_plane property to specify the white level of an SDR
>> +plane.
>> +
>> +
>> +Defining the color space
>> +------------------------
>> +
>> +We propose to add a new color space property to drm_plane to define a
>> +plane's color space.
>> +
>> +While some color space conversions can be performed with a simple color
>> +transformation matrix (CTM) others require a 3D LUT.
>> +
>> +
>> +Defining mastering color space and luminance
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +ToDo
>> +
>> +
>> +
>> +Pixel Formats
>> +~~~~~~~~~~~~~
>> +
>> +The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are
>> +unrelated to color space and EOTF definitions. HDR pixels can be formatted
> 
> Yes!
> 
>> +in different ways but in order to not lose precision HDR content requires
>> +at least 10 bpc precision. For this reason ARGB2101010, P010, and FP16 are
>> +the obvious candidates for HDR. ARGB2101010 and P010 have the advantage
>> +of requiring only half the bandwidth as FP16, while FP16 has the advantage
>> +of enough precision to operate in a linear space, i.e. without EOTF.
> 
> This reminds me of something interesting said during the W3C WCG & HDR
> Q&A session yesterday. Unfortunately I forget his name, but I think
> transcriptions should become available at some point, someone said that
> pixel depth or bit precision should be thought of as setting the noise
> floor. When you quantize values, always do dithering. Then the
> precision only changes your noise floor level. Then something about how
> audio has realized this ages ago and we are just catching up.
> 
> If you don't dither, you get banding artifacts in gradients. If you do
> dither, it's just noise.
> 
That's a great way to think about it.

On AMD HW we basically always dither (if programmed correctly) and have done
so for ages.

>> +
>> +
>> +Use Cases
>> +=========
>> +
>> +RGB10 HDR plane - composited HDR video & desktop
>> +------------------------------------------------
>> +
>> +A single, composited plane of HDR content. The use-case is a video player
>> +on a desktop with the compositor owning the composition of SDR and HDR
>> +content. The content shall be PQ BT.2020 formatted. The drm_connector's
>> +hdr_output_metadata shall be set.
>> +
>> +
>> +P010 HDR video plane + RGB8 SDR desktop plane
>> +---------------------------------------------
>> +A normal 8bpc desktop plane, with a P010 HDR video plane underlayed. The
>> +HDR plane shall be PQ BT.2020 formatted. The desktop plane shall specify
>> +an SDR boost value. The drm_connector's hdr_output_metadata shall be set.
>> +
>> +
>> +One XRGB8888 SDR Plane - HDR output
>> +-----------------------------------
>> +
>> +In order to support a smooth transition we recommend an OS that supports
>> +HDR output to provide the hdr_output_metadata on the drm_connector to
>> +configure the output for HDR, even when the content is only SDR. This will
>> +allow for a smooth transition between SDR-only and HDR content. In this
> 
> Agreed, but this also kind of contradicts the idea of pushing HDR
> metadata from video all the way to the display in the RGB10 HDR plane
> case - something you do not seem to suggest here at all, but I would
> have expected that to be a prime use case for you.
> 
> A set-top-box might want to push the video HDR metadata all the way to
> the display when supported, and then adapt all the non-video graphics
> to that.
> 
Initially I was hoping to find a quick way to allow pushing video
straight from decoder through a KMS plane to the output. Increasingly
I'm realizing that this is probably not going to work well for a general
desktop compositor, hence the statement here to pretty much say the
Wayland plan is the correct plan for this: single-plane HDR (with shader
composition) first, then KMS offloading for power saving.

On some level I'm still interested in the direct decoder-to-KMS-to-display
path but am afraid we won't get the API right if we don't deal with the general
desktop compositor use-case first.

Apologies, again, if some of my response is a bit incoherent. I've been writing
the responses over Friday and today.

Harry

> 
> Thanks,
> pq
> 
>> +use-case the SDR max luminance value should be provided on the drm_plane.
>> +
>> +In DCN we will de-PQ or de-Gamma all input in order to blend in linear
>> +space. For SDR content we will also apply any desired boost before
>> +blending. After blending we will then re-apply the PQ EOTF and do RGB
>> +to YCbCr conversion if needed.
>> +
>> +FP16 HDR linear planes
>> +----------------------
>> +
>> +These will require a transformation into the display's encoding (e.g. PQ)
>> +using the CRTC LUT. Current CRTC LUTs are lacking the precision in the
>> +dark areas to do the conversion without losing detail.
>> +
>> +One of the newly defined output transfer functions or a PWL or `multi-segmented
>> +LUT`_ can be used to facilitate the conversion to PQ, HLG, or another
>> +encoding supported by displays.
>> +
>> +.. _multi-segmented LUT: https://patchwork.freedesktop.org/series/90822/
>> +
>> +
>> +User Space
>> +==========
>> +
>> +Gnome & GStreamer
>> +-----------------
>> +
>> +See Jeremy Cline's `HDR in Linux\: Part 2`_.
>> +
>> +.. _HDR in Linux\: Part 2: https://www.jcline.org/blog/fedora/graphics/hdr/2021/06/28/hdr-in-linux-p2.html
>> +
>> +
>> +Wayland
>> +-------
>> +
>> +See `Wayland Color Management and HDR Design Goals`_.
>> +
>> +.. _Wayland Color Management and HDR Design Goals: https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst
>> +
>> +
>> +ChromeOS Ozone
>> +--------------
>> +
>> +ToDo
>> +
>> +
>> +HW support
>> +==========
>> +
>> +ToDo, describe pipeline on a couple different HW platforms
>> +
>> +
>> +Further Reading
>> +===============
>> +
>> +* https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst
>> +* http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
>> +* https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf
>> +* https://www.jcline.org/blog/fedora/graphics/hdr/2021/05/07/hdr-in-linux-p1.html
>> +* https://www.jcline.org/blog/fedora/graphics/hdr/2021/06/28/hdr-in-linux-p2.html
>> +
>> +
>> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
>> index 05670442ca1b..8d8430cfdde1 100644
>> --- a/Documentation/gpu/rfc/index.rst
>> +++ b/Documentation/gpu/rfc/index.rst
>> @@ -19,3 +19,4 @@ host such documentation:
>>  .. toctree::
>>  
>>      i915_gem_lmem.rst
>> +    hdr-wide-gamut.rst
> 


