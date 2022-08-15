Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4E5593393
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 18:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F34CE4E4;
	Mon, 15 Aug 2022 16:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270C2C6BC7;
 Mon, 15 Aug 2022 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660582387; x=1692118387;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V+iTJlEeGa7eRZ3bpxYCqShw2Xxr1PSAaUogPinqPt8=;
 b=hs+KCWLunZXx7BVuBFy3x0a5ZIWSajnVUwkaU8H1auTHzMJPeGLNOhEX
 IgTVc0OKuOdCL3AsvHN8MjIKtUKsePvNdeY49SbwGaLe+SZahE9r1YmD/
 uz/etbZaYttL2R/aZgEZX1IrToFIhnIf75wECyAFOW8kLRcc1XloPsW/R
 A7nBeDJX7/vD8n6bwNEOUj65ZgB3/0FiaGQGn9b3/qSj0nZCHsvFrPUFc
 Jb/HgN+W3TRl3+mHyZDbffJ8S+HxUntOY9auVzO8BVEfCcfbENJdAz3Wm
 /4SUVQoXNqwG9/imDiCsPvsGHR+YVi5wesb/Fov28BMLuokOwIMVAXVvO A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="378290870"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="378290870"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 09:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="696031539"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2022 09:53:04 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 09:53:04 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 09:53:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 09:53:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 09:53:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5BOXQntSTn+JhpwaonL2c60X10GLqu4PZirVyRBCjIJZOWVWjjtKkRCgUu3bGNPaqmQSfm7cueggD47eTo8aaY7+RvZX05NZNYI/nDfT4IrDJvCHqDqwq3JcLUC5WJxBAeGwr5oqUumuDt3yMAbkqOoqANsg6zkPgmf9cnE54il1dDD8NUHoTFZE2pnvME9EH2Tj9JwzE412gtTP2vHU5yvK/jmqPM1LdotM9XzJ+sMF1Aa1LGtP39qpRU+s7rsEJZ7Q993zIiDVwPJlAI5W12jlGkeB+XhO2dDXOTWTLtcBBSIfRgFlMkzQuqwFT40csXO6ejmY8CkeUCfcCcEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuumiBA2AOVxPeM/MTIV3FtoiNuMwY1BFCfLj5tb0kU=;
 b=SWXTsSGsKckfDYgWKkmDdG3rI7QUZ5d8uBiRAdDEL14YnQQDf9us4B97HsHBvQBd1mac+lzrhPgRaHgwCmIOs5QSiZl0B59PMfVvx0AZyk+5hC4z0hj0zjLyinf8SpuTQebOv2xefP7aSQzX1mD8JE+6nHd3/gOfsO1dFo/v61kQ1fOuPXD2ZpCfMtDyuF486GRr1ZBcJuTC+j5eF8yl72I37T8cqNQvMYlkOyMH+5eucqlvXsvhMPRTRbuB+YwRg0tmFB//sHErXytWDZqCB+5xVKQcs18kbon7CuPrUmJSSWzFYS0sUcvVPI2uDmE7XCPuVfRd02NEOlNhiaop9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by BN6PR11MB1377.namprd11.prod.outlook.com (2603:10b6:404:49::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 15 Aug
 2022 16:52:59 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::9403:806b:5455:c213]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::9403:806b:5455:c213%3]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 16:52:59 +0000
Message-ID: <31e1c927-f862-41aa-a80a-9946a57bdf4e@intel.com>
Date: Mon, 15 Aug 2022 09:52:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Allow SLPC to use
 efficient frequency
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20220810000306.5476-1-vinay.belgaumkar@intel.com>
 <Yvp5dp0Oa0sobOo6@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Yvp5dp0Oa0sobOo6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb0f36d5-6250-4cc0-ed16-08da7ede9be4
X-MS-TrafficTypeDiagnostic: BN6PR11MB1377:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uws/beX0SCNBVqtEi2P60j4Kvw1rxh4pbuP4gNzbmMkeciNYfKZfDO1jTSLrfJiLglvuPf1jWOUEOSD3JB3brYB8Z5AgUpQwIa93eQpWXKtESzNYimxFQ1+LHHf6U8mu2QKt5pRPenk2/iLP8H6d2H7Clipya6sl2HLvv04pKPVKbaGvILy2gEd2OBoB/U0efUMGb23hdZBa4imOYz1bThJdBlyJa8gVH4YJZMM5xD9y8uyYzy0eJ97bRPBpQqexprB+lml+iqoxtag8c2PSqlUzkFDg7gA+erNf+6OnauLQb5yeTz4YnD1CoN+ZPhK+g9Gj2C9UusLuAmaZDDrexpdPYQNLfwxOR9yI26TyT1MCsyHAtdpyhL4viHbdrU7ZJjujKZuwBtU8bfkoPXVwCBPQR9j/C14ZVsRQOkOP9SWi0f0WfdBAtJn1XUHIPzoYaqnhibvBIYab5+r7yOC9Qo6UAEUC0CH+IqR2PV/5iqQjaZ+wYkVMLjN7Z70H7+zVS0JcybH2AbYrgyGOXYI4uHxErPRi2cfNVYwvio/d2F0LdrilDu0ovvqQ78+3Kv0bfOzcqyFaASVw7RXzslnKivP/q3oZ6FoOmVNh6AoMXHGhM264UzTJo7kWS1WIEIvqdYqjGJk0d2ZB4mQsudVyJNFhgMQ66AbMfJvgpx7cRVrwqxAN+z8S3aNJVCYsDzj9nhh6nhALIzzIMUZemXl89XB3qO8OfeuWSHx2dcqohjsHAPVdeTtPBX9si9CeBTLzeOpD8Z7luelJ5ms57KQD/zhNzG5EWqgYYiYIrT05GjHV1AUAhmiylYA0dULiLI6AcZ87Yo6gF15fhKWuxz5YtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(366004)(376002)(136003)(396003)(478600001)(36756003)(6506007)(6666004)(53546011)(86362001)(31696002)(2616005)(26005)(6512007)(186003)(31686004)(41300700001)(6486002)(83380400001)(6636002)(5660300002)(450100002)(66556008)(66476007)(8676002)(66946007)(4326008)(316002)(37006003)(82960400001)(6862004)(8936002)(38100700002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXJpdlRRYW9sOHZ0Y245cUxoSGlybWNJUU9UdlM5WitZeHZpcmx6NGJqNXFX?=
 =?utf-8?B?cGxTNkUvSGxhR0V2dlFSamxsWHJHNW13djc0cjRLU2V0S1VSZXpuQ1huRWMw?=
 =?utf-8?B?clhMeDJQRlBmTmE2VlN0N05xNmVWWUJpN1g3aDdsNGFpVTBFYjM3V2NvaTQ4?=
 =?utf-8?B?R1RhbnBzQWxsRXdmK0w0TUJBL0F1MTNFT0JTVFdWL1JsM1RlQ3R2VmgyT1Yz?=
 =?utf-8?B?aDBoZTV4ZjBTbGtPaitRYUR5dTlxWjRJN3M3LytOaGpzcERGQndZYkpET2xJ?=
 =?utf-8?B?dWc5TUVpNzRiTEp3N3NjOWVJdmhDYkRycjhrSlJTS1VmbWd0Q0VWTXpsZk9F?=
 =?utf-8?B?WmEzZ1BuSEpDTGxxWkVoTE0rRnRkT3pJZHZiOW5uUzJhZkw2enZndS9KbXE2?=
 =?utf-8?B?dHN6ZDlmNHE5dFFqWVRKcEp2bjRzcWZHUDJwRzVCWG9ETkVrWDh0Zncwb2ht?=
 =?utf-8?B?K1RlaDI3NFJ5OEJIL0JsY1BzTjBlS3d0VUFKMVNzUFllQ2kvdkQ1TmdHQ1RT?=
 =?utf-8?B?TkR5bXRxUWFkOFRrWFRaVE5rRHhCbUYySWUrOUJzSjJpOFNGWE5BZXFJeUJk?=
 =?utf-8?B?OXM0aUdKcnVVTGd5MWFCUmo3dnh4Qi9XdEREUFdtYUtsalR3YXNIL1VvVWZX?=
 =?utf-8?B?OTFUZ3ROOXRyUHdadlFvTzRFNXhleXFlVVFQWmRIYzVuQzljYVovWE0wMlpj?=
 =?utf-8?B?SjMwREVPUEhXV2lZazB3ZzZXV2NXSUU3NE11ZE4wTGlaVnpDRjdnYlZ4V2ps?=
 =?utf-8?B?Zlp1aEZvNEMxQmlMcEM2aDZTMG5CbVBtWXhaWmNyOThQYVNobXgxWDVoK2F1?=
 =?utf-8?B?OHIzQzZIMVFHZm9KS29FbjJ3Z2ljQ3Q1czZFQXBJbFgwcTZKUnUwcHY3NkJv?=
 =?utf-8?B?Nm9VUktKU2xHNUtGYVRuSU9MS1lWdThETlZOQXBvN3gvMERLQ3daaC9SeDNx?=
 =?utf-8?B?SCt1czNQS2pUZG50d2w0M2YxUmhDR0N6Y2hoNXkxakdFdVBaZko2UDk3UnZT?=
 =?utf-8?B?emQvOFNFRDR5WGcrcEhManF1UEhMS01zdzQrVktheDJwNi9IMFhydzV3cWVp?=
 =?utf-8?B?cS91NGpWcWVCM1h6bURHZVNSWWdwS0lHSGZHR3FxQXlCOVkrTmRiNXpsdG5U?=
 =?utf-8?B?Mml4bXBObDNLWDFaMEJ2RnJxTE1pTTgrc0FYaWFBem9PVkZ6aDJ1cTdPMmhr?=
 =?utf-8?B?NFp1L0NMeENXSlBXM0JxdlRCQ0tkLzhxK3M3TjlUOWc5aVg2Z1JYbkZCR3ZI?=
 =?utf-8?B?bWV0dW5wQlRCR1NKMmpScDlmT0dlNXF5U2VWcXdWdndkMHd1MlFiblkyUDVE?=
 =?utf-8?B?ODd3WFNaWXJXaGsySUNxYmoyckVQaXFCUDJNNWVYUG11cDh0cURVYW1lV3U5?=
 =?utf-8?B?YzV2TVZXVG45bjViYVNwTEFReGNkZkNSU2xsc1kvLzJTbXA3bWVVL256TXE3?=
 =?utf-8?B?dWozdVFtUDZ0SXhOdUJiQnNOelpiN2V4R202U0d0SFExeUplOEEzdmMrWmRj?=
 =?utf-8?B?WFhPOXhQYVdoQjBzUll1eXo0ZnVnV2VUYzFUSk1kWnpvV1l4ZkNoelNTWnlq?=
 =?utf-8?B?clEwUHpKUkl6bFZ4TlQvNmRzOFpSTlBUaWNrZlVsWlBrKytuTTBGQ1pQUUEz?=
 =?utf-8?B?cTE3Z3A4MURIcnR2NmRzYVZZZHFnK2wzV2xFSWdMbGtxR1MvQ0NQdTNDNUJI?=
 =?utf-8?B?Tk13M3l3YlVyMXZIVzJkd2UydlpldkI3dURZT1pwMjJSbWc5dXpKTFlaejhD?=
 =?utf-8?B?U1ozdEdlM2VSSE5nNHkvL29XRFNJbHR1ekwxM20zc05HU0FSQzZKQTlkcXBY?=
 =?utf-8?B?ZWNjbFBuZU9FRjA0WU05aUpjanVqdlo3THFkb3BTczU5OWw5TDA3NHdvU1dC?=
 =?utf-8?B?cDJVaXJSNHh1emRYYTJwNEZ1RlEweHd3dWNlaERaWXp6bkVGVFFJQjhzYjJP?=
 =?utf-8?B?aUhQYnhia0hEMkFNRXlGclMvaE0yWGRWMTNObTlORlhubUdFWi9WazJtOSsx?=
 =?utf-8?B?c3BZd2pnRUN2bmgwVnZscTFBTjJaZmkwYmFJSE1xTHY4SDlwd296VXhsY29D?=
 =?utf-8?B?VTdLTDNWc0k0MXFwNDVBLzFPVEhTdVRnNjJBTWoyc3ZrU3U1Z1R2WmVGcisz?=
 =?utf-8?B?T1UxUCs3NzVPV3pyaWUyUFhudGV4QUx2TnU0ZWdUY1lLUGJ5OGxHeDRKWHRS?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0f36d5-6250-4cc0-ed16-08da7ede9be4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 16:52:59.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7lBthga/GGyPIzzgtjzCy/KH+OBvdh0qI4knmPcufI/AHj4MvW30lAVFjHCExPMqVogT/WO4YWUCFS+4hZ4E0EcuCmIRJGsP6G1GzeTF9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1377
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/15/2022 9:51 AM, Rodrigo Vivi wrote:
> On Tue, Aug 09, 2022 at 05:03:06PM -0700, Vinay Belgaumkar wrote:
>> Host Turbo operates at efficient frequency when GT is not idle unless
>> the user or workload has forced it to a higher level. Replicate the same
>> behavior in SLPC by allowing the algorithm to use efficient frequency.
>> We had disabled it during boot due to concerns that it might break
>> kernel ABI for min frequency. However, this is not the case, since
>> SLPC will still abide by the (min,max) range limits and pcode forces
>> frequency to 0 anyways when GT is in C6.
>>
>> We also see much better perf numbers with benchmarks like glmark2 with
>> efficient frequency usage enabled.
>>
>> Fixes: 025cb07bebfa ("drm/i915/guc/slpc: Cache platform frequency limits")
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> I'm honestly surprised that our CI passed cleanly. What happens when user
> request both min and max < rpe?
>
> I'm sure that in this case GuC SLPC will put us to rpe ignoring our requests.
> Or is this good enough for the users expectation because of the soft limits
> showing the requested freq and we not asking to guc what it currently has as
> minimal?
>
> I just want to be sure that we are not causing any confusion for end users
> out there in the case they request some min/max below RPe and start seeing
> mismatches on the expectation because GuC is forcing the real min request
> to RPe.
>
> My suggestion is to ignore the RPe whenever we have a min request below it.
> So GuC respects our (and users) chosen min. And restore whenever min request
> is abobe rpe.

Yup, I have already sent a patch yesterday with that change, doesn't 
look like CI has run on it yet. This was the old version.

Thanks,

Vinay.

>
> Thanks,
> Rodrigo.
>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 52 ---------------------
>>   1 file changed, 52 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index e1fa1f32f29e..4b824da3048a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -137,17 +137,6 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>>   	return ret > 0 ? -EPROTO : ret;
>>   }
>>   
>> -static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
>> -{
>> -	u32 request[] = {
>> -		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>> -		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
>> -		id,
>> -	};
>> -
>> -	return intel_guc_send(guc, request, ARRAY_SIZE(request));
>> -}
>> -
>>   static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>   {
>>   	return slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING;
>> @@ -201,16 +190,6 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>>   	return ret;
>>   }
>>   
>> -static int slpc_unset_param(struct intel_guc_slpc *slpc,
>> -			    u8 id)
>> -{
>> -	struct intel_guc *guc = slpc_to_guc(slpc);
>> -
>> -	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> -
>> -	return guc_action_slpc_unset_param(guc, id);
>> -}
>> -
>>   static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>>   {
>>   	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> @@ -597,29 +576,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>>   	return 0;
>>   }
>>   
>> -static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
>> -{
>> -	int ret = 0;
>> -
>> -	if (ignore) {
>> -		ret = slpc_set_param(slpc,
>> -				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -				     ignore);
>> -		if (!ret)
>> -			return slpc_set_param(slpc,
>> -					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> -					      slpc->min_freq);
>> -	} else {
>> -		ret = slpc_unset_param(slpc,
>> -				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
>> -		if (!ret)
>> -			return slpc_unset_param(slpc,
>> -						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
>> -	}
>> -
>> -	return ret;
>> -}
>> -
>>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>>   {
>>   	/* Force SLPC to used platform rp0 */
>> @@ -679,14 +635,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   	slpc_get_rp_values(slpc);
>>   
>> -	/* Ignore efficient freq and set min to platform min */
>> -	ret = slpc_ignore_eff_freq(slpc, true);
>> -	if (unlikely(ret)) {
>> -		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
>> -				 ERR_PTR(ret));
>> -		return ret;
>> -	}
>> -
>>   	/* Set SLPC max limit to RP0 */
>>   	ret = slpc_use_fused_rp0(slpc);
>>   	if (unlikely(ret)) {
>> -- 
>> 2.35.1
>>
