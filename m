Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E98653A298
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 12:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C17C10EE73;
	Wed,  1 Jun 2022 10:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AE810EE82;
 Wed,  1 Jun 2022 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654079517; x=1685615517;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SeHHgpUpMHiLGbKJF3JJnzpPyR3+X0EPR6jcobTDacs=;
 b=b8lLgX1/ksC7SllRqdqzRjDCUemMLXj6xlvmVlPIcm2mm5YW4t6vVnUF
 NYZrHjLCOGfUEvhOpTvsG0Z2OHwtu/yIz1ZlSvi4XyS1AH1g0rFucmCf+
 mYa7v9N7z1uGXHK9TAgwzx3WR39aISWKCxt0XMOQ5leYYp4RG/Ivp6iWW
 OQvZXp7iQvoSp9iISH9Kdu05J05X0oRc+U2AK1c/sXhntsmXqEnQuhHfc
 WbpNr/HI2ZfbnPGyDd9vQKIeomCAgn7zCpDc5wRY1dtTuOVPGiq0nU7K5
 8inZoows6Ph+Mp2iuSEv+x5HNQkUz566qXcDlcPmZkUqHeovyhaPvJ3LP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="274345912"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="274345912"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 03:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="667363231"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2022 03:31:56 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 03:31:55 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 03:31:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 03:31:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 03:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIpJUrxylhz9X4MNQHBt6ZwiKzMAgi2YKLKqDzimBsq3qF3s9XEY9CdPycQtzKsBqsxkJpWK6edR9yOn3Mc4iF7xdZcQ89FsFP78oLpSQpYJ8JhFtJDvZ9s/mijmlB820VdzMqpZvwadGhm39QXTqCqyTcwymDbzJqr1DUqM6V4RQpuG/eK8kxw4dcgVs2PpZSjpYciCp8ffB6HV+7SCqzwoQ3/x5QdT8k3xaKJ7+VvS1tak1DIebTHyPzp+VWN2YS/ll5BP1aDdXVmsXPdqnLdaxfJaQUUSZjh6EFH+WU6FYUrP15JG8vAr8wI4dAf60tiAyns5R8loWEZHpKrNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4CLUMpx0C42ObX8fAD8Y62qfda7mUVOMfFu6DlGMTk=;
 b=bY+5RnLIvkVL50GysLybmhi8lXtdO4GbaIMzHwkjT50mMc3dGZNS/cPlJ7eFjKHqRLLhALBhCfi2opugS4+tXoYquDXMpmrajrC/endmszMoYIFzD2bPEH21/iBylyODbc7bxnwrnarz9xeNDPMxaZpGleb6rseX85hKdcEcLbscZr4T2I+udrRfCSmQJ/cjRAqGMrcquqNM6HqLs8ku8TbiXpFVhN4j1en/2R8d1xS7ujWx3Cd7hRQdJTgm0A4xbBQSnNuEiw2dIFYafIglz01AjgFr9kgMIwuzfknBnuGDYLdQAymX8XOxsOn3TnRFua8XGSp1wMwmbBDhOjNPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CH2PR11MB4487.namprd11.prod.outlook.com (2603:10b6:610:44::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 1 Jun 2022 10:31:53 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4165:e33d:ade7:9ba4]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4165:e33d:ade7:9ba4%6]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 10:31:53 +0000
Message-ID: <d5e08967-6bdb-3f9c-b014-7f8e069c2aa4@intel.com>
Date: Wed, 1 Jun 2022 16:01:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC V3 2/2] drm/i915/vrr: Set drm crtc vrr_enabled property
Content-Language: en-US
To: "Navare, Manasi" <manasi.d.navare@intel.com>
References: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
 <20220517072636.3516381-3-bhanuprakash.modem@intel.com>
 <20220531171451.GB257110@mdnavare-mobl1.jf.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <20220531171451.GB257110@mdnavare-mobl1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 307a2b4a-38c0-4ede-240a-08da43b9f1c6
X-MS-TrafficTypeDiagnostic: CH2PR11MB4487:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB4487EC62046B73C3CFBDC0AB8DDF9@CH2PR11MB4487.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hB9LQeUc9qna/Xf3Bz8Pdkl7IFNVV0jGq+tIh4kn21MrZHN2oXpDkhwaplsFuV1QbG1fHLTnCnlJPHXVuJu6zWd1fu/iqann0rBwNmcPSkl/hYTmKD7adxavrfa1Xjpg91kObNmN0fK4nF3rvjgtDy11aMW/405ba6D8fYugkBC/D2Yvnk2bZnBz7ScgrUVCUQP1caYUF8vskGOEbzdukog4fjLF1Bv8X+lmJmLLdLLucjPbFAkWiy2ow+6VhsjR3mCxgom8a5W1P+m9sNUKY8OlkwUyBKBh3qx+mRvFBZDH4aFEc/asBFv0BhkM1c1iJm1Z1eJINgbOuHo6yDdpVjkBmP4KEgnWf05uUfiQyfeZYAqpSevZGdWC1NZDW9LE7gyOiWM9nHk3mGU+Mp9Ppzqo9Ogm1+aXoGPsTjbqtEyL1ic4ZxCyNG7XdWC5QskPi9JmVO6+Tgx06dMWAbrQUiMERC683TZtuzGp7ki7EH6UvoRkUwYR5bW/YP9WmIW1FMYwaiGL/4IViRAtzZb069MuH76dCsY13VZAsjMAFLQoQNc5vHaejRj7Y86xPWFDeIOc/mzZ5vwK4nodmtcr4lRti45NZkpQDOKqnEH2Jj5Y2uuBflGrTQ8ltsE2LJJgBo+9INUfbxKB+fuPoLyPvhQ53kNqtGtVFhbYggAeE99M89QnORR1wdSL5FBWDiZNBHesHsJh37YQDX3MUpUBdLJggrOy1aVHufSY+pVuTc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6486002)(66476007)(316002)(26005)(82960400001)(6862004)(8676002)(6666004)(36916002)(4326008)(31696002)(37006003)(6506007)(83380400001)(86362001)(66574015)(186003)(6636002)(66946007)(66556008)(2616005)(508600001)(2906002)(8936002)(5660300002)(31686004)(38100700002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDh4YmpEdzBneExYa0hCQzVUaVpER1FxOXlKelF6LzZyOXVGeTVaTWdGMVVp?=
 =?utf-8?B?cDJCbHovRGkyeDF5Z1lQdlRaeDlzMndGRUN5bm1ydVdmMGxFekIvcVkySzMx?=
 =?utf-8?B?U3dDaklqZ1FhVGxFNlRnYngyOFBJNUwwOVBKdW1tSU95VEZZRTRIcWVQSUFM?=
 =?utf-8?B?amNVckovVXRuVFdxWjZ1cGFTUVpVcnlFY0JGcWg1VzJHTUlJRW9ubit3K3kx?=
 =?utf-8?B?QVEyWjYrRXdTMVplMGthcHpzemJkdWJGamJCSWFsYXE3ZkUrR2REWWErblRw?=
 =?utf-8?B?YmZtajMrYXlXeTZSWFJsS3VYWkRZKzJnM2VpTGNiTHB1Ulg0Ym1wNktkSzh0?=
 =?utf-8?B?OW1iVkRhR1ZNdU9OWnJSaXJkQmJtbXRvSVE4SHkzZjJxQU1DUDM2NGwyTFhv?=
 =?utf-8?B?M0xMR1hoUDh4VGVXUm5RNEN5VE1Id2xkY0FVcW96K3hxR3RGTTJlK2xRSXRv?=
 =?utf-8?B?SGkyb2w0TnVwd05zUzIzWTViZlZqMWFnYzdLSmQxYkhnZ2o4dUhGNW5WMzZE?=
 =?utf-8?B?ZC90MUZvSFFNdFppM2hOekk0Y1RPckc1dTdJZTdNeGJJVjRtQ0lpU1pVOHJv?=
 =?utf-8?B?NkZsY0RudjBuQm8xWlBvaHVBZ2NET0RONG1NVGlGYUt2dWFSNHFUZ3lEZktu?=
 =?utf-8?B?RXY0N0lXK3VPblBWdFhXUEs5bjVGOGtsVkhSOGFpakxpZkFPc1l2cHF0VWNQ?=
 =?utf-8?B?RjMzVmM1Wi8vVGxhK1F6WXlkK0JLRmFTclk3cUZSQmpMSHFBUW8ybkdYZ090?=
 =?utf-8?B?ZEpBcnJiQmpGM0pDajBGa3laTHBmOUVaRnVUVlc0V09ueUt5RXBBVzJJNHpy?=
 =?utf-8?B?Q2h0UGhQbEpZUUU0Z1NKZHg2aVliSTlyRGkrRkxBSkwvaGVVckpJcEJIckFQ?=
 =?utf-8?B?dXlmUFNjV21vZzZqeC9jMXZWSHFEQ3Vzb0MrWWdZTDV1TXdBMEtPZWFaVjZm?=
 =?utf-8?B?RFQ5bVZTM2JFVjNhMHNORkpVTTFCWUM4NWFiY21Zc1pTYjQ4UzZFeTlZZkQx?=
 =?utf-8?B?bjZqLzY0VUE3elpDV2ZaV01pNkJEaFlHL0hwcUFoVWh4U09xaHg4NEJ3S041?=
 =?utf-8?B?WWIybjdBNXIwVS9lR05BeU5mdnprbG5lNGdmallxYnlwNWdVclBneWZOS0xZ?=
 =?utf-8?B?ekxNRmxPY3lYaGdzVEpIZmVKVE5TU0cxSFhWaXhaNFZpa2srNGJRdTFsYy9s?=
 =?utf-8?B?Wk1XWkpOL3hBMW5BbnUrZ2hoaXNrRTlOUEZ2WkU2dFJUNVVua0ptVWsxU3RO?=
 =?utf-8?B?L0RhdkJDaHE4ekNmR0NCYUhrTHNWWmU2ei9pUkc0aEJBa2Z1dGlyTmprbHRk?=
 =?utf-8?B?UEpNMjgrTkdpSmdFdExhbHhEYTBwTkNjTDBYV0hlVnNNRjFnbjU0dEtaYldk?=
 =?utf-8?B?NXhRYjRnYkFuQ1N5VUdnZGJVaGoxWXA3Sjk2cVFDbHFZemp0Z0F4MjZJOUVE?=
 =?utf-8?B?OFJoWnlFVm9jeWVzU0JaL1d3bTRUZlA3ak96eENNd2lWdU16aGxENndIdzRY?=
 =?utf-8?B?azZLOCtqbS8yNFlDcWFIMklJZ1FIWEIzdG1kajNMK3VKYldZcjR3eXBYZXAy?=
 =?utf-8?B?UDRZNmNyYkNXWVpjclZVQ1FwS2pVb3hqTjR1YVhHWmFUREM5UEU3ZmxjNXRk?=
 =?utf-8?B?eXhlS3YzV3N3YTNqWmVTZFdxZEVGUGxNVEgvQm9XYWkvTFlWc3NSdDExaXFk?=
 =?utf-8?B?RVlTUjBlYlFkZ3NWUGdmRnU1RHFDZ2NqdmVGRkNrZGZYR3dCYm90YW4wcUh3?=
 =?utf-8?B?S1pRRFlHaDNyUXpYVyttUjdJMU1tMjE3dXdha0xETTlpNkdlOSs4TmdNOVBD?=
 =?utf-8?B?dGVtR0huM0hMUDF6YjFwM2NJait1QVkxWk1GdTJQMERMZGNWbjZRVnRrN3Rl?=
 =?utf-8?B?Uy9WTmRwdm1vY3lXTkFDUW9ZbzZPTmJVZzlwN3ZzWnJmMXNvUm42UFlrcmtk?=
 =?utf-8?B?VnpNQVMrZW9qcnFBZjZtWThTUWs1L05pbkNoL0c4SW9nd28wVGZHSk1OMU04?=
 =?utf-8?B?SjJ1M01HNDJDc3lOLzREQ0VmYkVrUGxMRG54ZWhWWitnU0paOERXNmcyTUxE?=
 =?utf-8?B?M2tPeGw3dlpvdnJISWIycjFtdVlLWkRxL1N1UGtQcFlJYm1zRHFtbUhDTGsw?=
 =?utf-8?B?WEl4bXl5UEFuZnlJd3J1RElNQ1pQTGsrRU1GdFhrOFowbUdWbnI0VUVRcHhY?=
 =?utf-8?B?cU1IN3V2QXh5SnRzUnlGNkQ0MmFyaVZENGUvM0k4T2NSUUFKWFpENDlEK01M?=
 =?utf-8?B?UDZzN0pkUVBQWHJPMlVFNlE1WnBwdTJzWDhsaG5aV203cndHai8vajF6K3V0?=
 =?utf-8?B?RUhUQ0NBQlRlbUs3cVFDcG5vZ1pQVWdLOXd0OEZBR0dWSlgxUm00OW9yZkFT?=
 =?utf-8?Q?cq5+//zv6qj+5hwk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 307a2b4a-38c0-4ede-240a-08da43b9f1c6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:31:53.4726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXxPO/zKjPztBd7+9jo+GR/dNmmFF1XFocMGK2m5XgHKjsovi4lXrmtSkDcPm6EPDwBJ7XLlc+Bm++LicoeLVpmVVvrT4C6/4SZMiSbu5uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4487
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

On Tue-31-05-2022 10:44 pm, Navare, Manasi wrote:
> On Tue, May 17, 2022 at 12:56:36PM +0530, Bhanuprakash Modem wrote:
>> This function sets the vrr_enabled property for crtc based
>> on the platform support and the request from userspace.
>>
>> V2: Check for platform support before updating the prop.
>> V3: Don't attach vrr_enabled prop, as it is alreay attached.
>>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Manasi Navare <manasi.d.navare@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_vrr.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
>> index 396f2f994fa0..7263b35550de 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
>> @@ -160,6 +160,10 @@ void intel_vrr_enable(struct intel_encoder *encoder,
>>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>>   	u32 trans_vrr_ctl;
>>   
>> +	if (HAS_VRR(dev_priv))
>> +		drm_mode_crtc_set_vrr_enabled_property(crtc_state->uapi.crtc,
>> +						       crtc_state->vrr.enable);
> 
> But here if userspace has accidently set the CRTC vrr enabled prop to
> true without cheking VRR capabile prop, this will be true and here the
> driver will still not
> reset it. If that is the purpose of adding this then we should infact
> set this to false if !HAS_VRR

Yes, my intention is same as you mentioned. But this looks correct to 
me, because:

1) HAS_VRR() is a check to make sure that the driver supports VRR. If 
there is no VRR support on the driver, then there is no point to 
set/clear this prop.

2) crtc_state->vrr.enable is true If vrr_capable is set to true, else false.

So we can interpret above check as below

enable_VRR() {
	IF Driver supports VRR:
		IF VRR_CAPABLE:
			Set VRR_ENABLED;
		ELSE:
			Clear VRR_ENABLED;
	ELSE:
		Do nothing;
}

- Bhanu

> 
> Manasi
> 
>> +
>>   	if (!crtc_state->vrr.enable)
>>   		return;
>>   
>> @@ -211,6 +215,10 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
>>   	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>>   	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
>>   
>> +	if (HAS_VRR(dev_priv))
>> +		drm_mode_crtc_set_vrr_enabled_property(old_crtc_state->uapi.crtc,
>> +						       false);
>> +
>>   	if (!old_crtc_state->vrr.enable)
>>   		return;
>>   
>> -- 
>> 2.35.1
>>

