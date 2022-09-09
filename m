Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC85B35B4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 12:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF1910E2B0;
	Fri,  9 Sep 2022 10:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F6310E2AE;
 Fri,  9 Sep 2022 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662720787; x=1694256787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3w6V73NPW3G4dysUDoDN9kZG88RVu5wcp8GBmBiKXiY=;
 b=GfJlq7FO+xjZGqjY5Xnue8eAoTuhsh4b+/Jf/Sa5OSDVfQu6MO1QC235
 U74xe9KDv0SBJpxO/Ptrx0iDUheAaF+XMWucLqQj20HDJjK9dYR15ZzaO
 u7yuhW9r7w32ST0Cp8gJM3gLdsdJGBBrl90iUFWHzh5B2VQAQYn7+TL1M
 8Nudc7aNLvoKG9HoSv1bKQ3xvJ6W0M6aDt6RuBOOo0zhIahCMgltF41z3
 mZepydicxKGLQ3O5k+TwkOCMu4Ki1pk9ZtUawlIO7eywFl+FPJoSI/RDV
 Y/Fdl6YkzVf98WEmS9G7f0tnARXda9UiAMXvuN91wghpAi0FIObGWMBbZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361405166"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="361405166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 03:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="645494973"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 09 Sep 2022 03:53:06 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 03:53:06 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 03:53:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 03:53:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 03:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGdpohDSihDYaNtkMB0/PCbA4zRzYQxorPCRL7BUq+jfwyu35AQ5ZdnOUU/NigtC3oK/Ix0h+AYYe9K0efXip+a0rsRvEMn+cu5x2f2VXF9DCZXN8o90uV+8Iyr5tM6bfzxoQEKIpo/6WcqJ2dPTHmdgIsBmuGlFHFK/psMe3ceF6uP9boajqVdNY16QfDRcxtWBi3s7ZUAINOsl8VLdYT/QS5ugRhDVUy6KCnI1RdKvGynYoCiKxOPVxw/58otouKWjpQYYVSWFs+dTXrQj3OczWnxxNSviJykjBQKzkXD3F0cLoPe8eoKdEEX6lJ9VFuFSunZnZeyHuN9TIvNACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LAt09LwuuErjZlDSbLgYsROxTlO1yfkMfktsnlLvqA=;
 b=gsCh1KZVzmcXUUsoA/pfBgm6slIWnQyuCwbdmHlnbFP1S3CT631hHbBu2MkrS9M2nOE8BVwvOorkq+JMv/qQT6yv6EO5rXoOob5fjIES2oMeYib11x7F/nL0ihpuRnQGpBs5nKHiGdSNwKQGaReRrgnckNMKLl5pTOb276M2S8aJqZ9cWpO1Sn+SljQGorHNm09DODna2Ifcl7Om2QmWz1NnsJyDCGWHcWeX+jDy/a+EvhkWuHOtwuODY7Z7dTzc89PO6kqceGKyIGK/imKToNB808wnbbsGXYGI5G9pnPheXy427TQXv58qCG6ym4JrRKjVbD2N3hGdwruAJSeOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 10:53:04 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%6]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 10:53:04 +0000
Message-ID: <c3241b2c-ed33-fb4f-e50e-7f8e46de301a@intel.com>
Date: Fri, 9 Sep 2022 19:52:41 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v9 1/8] overflow: Move and add few utility
 macros into overflow
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Kees Cook <keescook@chromium.org>
References: <20220824084514.2261614-1-gwan-gyeong.mun@intel.com>
 <20220824084514.2261614-2-gwan-gyeong.mun@intel.com>
 <202208250848.1C77B9C38@keescook>
 <1d8cc163-2435-42bc-83c8-62648d3c5ada@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <1d8cc163-2435-42bc-83c8-62648d3c5ada@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::15) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f28613-6f6e-4f51-73f2-08da92517875
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1OcuGckUpCbvrmz7guZVE7qP6KOiek5GP/MaCntk6rXTbX684ytC5Cp5tLcUfBmvI32QYBb6md/VF9GAT7LJrzPRTxyQXYmLP2ZWl640oJvMdHMqHB2c7K3e5sukL/7qqO61q6QWXIMFpRtkps7vijxnE7PaWZ66vwXNhWyVSSxziA8sc5PRRanXNFW6oPG2GHGtDavufGPSOo6qaDmzWs6Tg8DkIXRRU6XnD8cNouya2K/Iz9PuM0R0/MbZC0CR7Dl3x+LcrJA3+Y67c/biKW2AW0kg1qL1Yud6q6McvfYjYXUhgJbHItar5h7/8tLJXe4gPLN6N5f9KqfMyDX5Fw9pfGjgGbAtKqpPthm/R4JO5nFGI4fGWJThc7Pe/ULI72y2cxTLyHPK7d2wEl2Ezk71tXZKFiGl21v/MUft9ZxoJrY75dkY8/FLNxQtqTrymqHgFcNqvG2r9qr268b9VBCufesLA7OaUzBDCk+aE/YLvxGNzu8Qz+9cAzEB95G4BEklHP406dz0MQYVCybuOXNJnq4Z/c9z6YElCeD8JA0Du7I8WmJxxy7hO+9Qyhqgyp3nT3MqHRnsE3NMV90ZOs7D+gsFZ4SNXux5ca5OqtOt9jfpkmnAjUp+OK0qPCYhGJmr3i1b+RsgCeZebVSzW22MCsaWoi+/A7+qPGQLqlwXgBJGaiihaX6+lEbmxZE61JgOG7mYb77u9KImxsFQ0iodfGL8DVIcM8WWbsCo05XRDSC0v6nmwfb3gsfKexkPN/Op0LB43X++1M0/DGa2QV8kXa7nSo0qfgPCxKvkMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(136003)(366004)(396003)(346002)(8936002)(66574015)(7416002)(5660300002)(82960400001)(186003)(83380400001)(2616005)(31686004)(66556008)(2906002)(66946007)(8676002)(4326008)(66476007)(36756003)(86362001)(54906003)(6486002)(31696002)(316002)(6512007)(41300700001)(110136005)(53546011)(26005)(6666004)(6506007)(38100700002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFNuSWZrbHdtbVM3K2lMK1p5RFpkbGI2WEs2Y1RqcTArcHVWb2NoSW9ZVXYz?=
 =?utf-8?B?ZkgyMUsvaDBSMVB3VElaaHVUZXp5NWtZM3U0cjJNaVp6U05CNC9zakhGYWVY?=
 =?utf-8?B?T0RuSGdjUTg2UlgrenhrZzJENElQOU1OMmI1SXFIREx1YzQ4WExURnErOSt5?=
 =?utf-8?B?NXZrcWJZSlBYOHRmNVQ2WHQ0MkQ2dmgyb3VzYUdaMStWanhTYWdJeGZSR1lh?=
 =?utf-8?B?aE1vVFIzYTNlL0U4VEVZeE16MGFnS2gyd0tTcFBUcUorVHNHNTV4Y0piYkVQ?=
 =?utf-8?B?N3ZEOTBzbDFpcFc4VkNyemllZUxOZ1Zld0ZBYlRwOXIwQWpXc0UvbjczZnRF?=
 =?utf-8?B?eTFydG9YM3hCc1ExTGRrbFN1dSt4WXBxbWJaSTlTVjAxcnNyUWZZa1NHUVhy?=
 =?utf-8?B?K1h3YklGWXpEbmFleUVZemwwN0xQMlJHTE80akMrRUxSclhlZ08vbEdabzdR?=
 =?utf-8?B?WWJnQ242N0gvZzRiRVhDY1ZQaE1VaEJLbEJqeWxZTjI1aVdRTHR3cFRHc0Rl?=
 =?utf-8?B?Z1JqZUE3WkpPYW45UjhPTXFyVjNGcjNZNlNBbS9EVm10Z2xlejRqV2grWHU2?=
 =?utf-8?B?RktYYk1KbmtJOTRJVStqdERCU2o2d0JoZ3hVdFU5bEdsM2J2UUwrVzlQbkpB?=
 =?utf-8?B?ZE1BN0pmZ0dKOFFScy92SFhWRXNJR1lmaHBLOGZ3ditnN05iK1VLWmltZ0xX?=
 =?utf-8?B?NlZHU2dEYW1EZ1lyUk05WFc4SmZBYzhBNDRycDFqeDE1U0R6UW9kbC9zNFZi?=
 =?utf-8?B?ZkVBZEhwWVduVkl4b1ZWbzNucDBSTVhCWU1kV3B5MExhejBFS25jUXZaaTJ3?=
 =?utf-8?B?Mng3bzRPZ2I2STNlcmpCMlhSTHh6ckc3Zi84MmE5M2lSL2JmU1pKeFUzMlZj?=
 =?utf-8?B?R0dLY1pOdjhlbFZ1Tjc2MXpzcGhSVzh0K1M2WGRnbGVXSmFIMmJ0OHRLM0hG?=
 =?utf-8?B?SUVmaytYSFJjQ0FEcG82U3R1L3JiN0pPc2VVWlBSVEdPZ2NKMlVsbUF2dlo3?=
 =?utf-8?B?UWhycldUN3NSbG1IdCtMeXk3YUJoWWw1djF1Z01zSUg4OG0rbmx4Sy9lRzIz?=
 =?utf-8?B?WXRJenk5cGthazJNSHFFb3VTMTFLeVd4UmFOOG5Pd242MVN5alBjaDY4UjE3?=
 =?utf-8?B?REtaZjFicUVBYklkaGtJaHZSNmZaU0JPRC90TjFWUnZkNktXY0UxKzlrRllI?=
 =?utf-8?B?TEc2cjZCTXQzb05XZ3lBalUveUJReXk5cTBSZFJ0bjMvSDloYmwvUlBYS096?=
 =?utf-8?B?SldQQTFmOUZZbDUvSEVweU9qSGZHb01rNC9pMS9VTUhLeU5DWmJ1elpXelNP?=
 =?utf-8?B?TTFCeC9MdWVWcUxIZ3MyZDZDZFA3bjhVZVo4U2NwUVk2NWtKcy9LSGJGQjV0?=
 =?utf-8?B?aEtTZWVQamZUR0ZnZXNiWjJRODRpZHFiZzJSK2FVRDNTR21EUE0za3p4NFF4?=
 =?utf-8?B?UkprNitTalF5MjY2bG5TVE16d1NhdjQ2c1VZTEIwQ0dUZFJhU0xCMWtMQTdw?=
 =?utf-8?B?UUhNUStjZEhHdVFWdmljVW5idlZuWGtabW1XdmJWRnVtb01HM0tmNFJCTGRm?=
 =?utf-8?B?cDlJMmdDWGlod3ZpVW1uRUJDSXM3RWxmK2lzcVVBa1lWem0zd0NGT2ZKUnUr?=
 =?utf-8?B?ZnoxUUNLSGx2MTZjeVJNemIwVTJtVHMxVTJMRDJ1UTlwOEJOZkE5K0lNbVNw?=
 =?utf-8?B?OVpQc1I2aWZRZ3pNdkhtNll6a2Y2NHhFWE53aHV3aGJyVmNTV0RTaWhDNnRQ?=
 =?utf-8?B?QnZZTmt4Q2k4QTJidFpZcUxCcTc5VWNxRVF4VEVCa2JuSHhGbU5oOE9FWElF?=
 =?utf-8?B?WHVkaXl5UnZWbS9aS3NtY2xWQjNhODh3dmZ6Y1BlenJWM081SkVjVkdFRVV0?=
 =?utf-8?B?bmYzTUhDQnhIL2h3KzFvZE5qcm82ZDF6c3lHcEVqWG8zNUg5MFdJRkwxOTJP?=
 =?utf-8?B?dVdIaStxMWFGK0xidmNSRDR1QlVRTWNldWZpZlN2ZGR3dVM0VkNJZTNHNDlu?=
 =?utf-8?B?REJNNjVLT2EydFJVaW1FNjIxdkhTQ2txNnJjK2tYVFZDc0xMOHFwcHBoZDZ6?=
 =?utf-8?B?VFNYakhreGlGenFINVhVSEd5YVBZZkhSSWxOYTA5blBQVndBYllwN00zenJa?=
 =?utf-8?B?dE8vdkErd0FpbkhVemYyRGRlR1ZEdEFOMlFOZVJDNmlIaW94K1g0MXB5ZDJZ?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f28613-6f6e-4f51-73f2-08da92517875
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 10:53:03.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D7SlmezfCBmCNVQRyDg6JKbet01IEwvwSQ2VdZKD+tzewX2d5er6SZEWcRht9AX3c5VYmrgL7RHv/HV/prS39eGKw2mI5JOQNOQ+jCBzh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, intel-gfx-trybot@lists.freedesktop.org,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/26/22 10:44 PM, Andrzej Hajda wrote:
> On 25.08.2022 18:47, Kees Cook wrote:
>> On Wed, Aug 24, 2022 at 05:45:07PM +0900, Gwan-gyeong Mun wrote:
>>> It moves overflows_type utility macro into overflow header from 
>>> i915_utils
>>> header. The overflows_type can be used to catch the truncaion (overflow)
>>> between different data types. And it adds check_assign() macro which
>>> performs an assigning source value into destination ptr along with an
>>> overflow check. overflow_type macro has been improved to handle the 
>>> signbit
>>> by gcc's built-in overflow check function. And it adds overflows_ptr()
>>> helper macro for checking the overflows between a value and a pointer
>>> type/value.
>>>
>>> v3: Add is_type_unsigned() macro (Mauro)
>>>      Modify overflows_type() macro to consider signed data types (Mauro)
>>>      Fix the problem that safe_conversion() macro always returns true
>>> v4: Fix kernel-doc markups
>>> v6: Move macro addition location so that it can be used by other than 
>>> drm
>>>      subsystem (Jani, Mauro, Andi)
>>>      Change is_type_unsigned to is_unsigned_type to have the same 
>>> name form
>>>      as is_signed_type macro
>>> v8: Add check_assign() and remove safe_conversion() (Kees)
>>>      Fix overflows_type() to use gcc's built-in overflow function 
>>> (Andrzej)
>>>      Add overflows_ptr() to allow overflow checking when assigning a 
>>> value
>>>      into a pointer variable (G.G.)
>>> v9: Fix overflows_type() to use __builtin_add_overflow() instead of
>>>      __builtin_add_overflow_p() (Andrzej)
>>>      Fix overflows_ptr() to use overflows_type() with the unsigned 
>>> long type
>>>      (Andrzej)
>>>
>>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>>> Cc: Kees Cook <keescook@chromium.org>
>>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
>>> ---
>>>   drivers/gpu/drm/i915/i915_user_extensions.c |  3 +-
>>>   drivers/gpu/drm/i915/i915_utils.h           |  5 +-
>>>   include/linux/overflow.h                    | 62 +++++++++++++++++++++
>>>   3 files changed, 64 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c 
>>> b/drivers/gpu/drm/i915/i915_user_extensions.c
>>> index c822d0aafd2d..6f6b5b910968 100644
>>> --- a/drivers/gpu/drm/i915/i915_user_extensions.c
>>> +++ b/drivers/gpu/drm/i915/i915_user_extensions.c
>>> @@ -50,8 +50,7 @@ int i915_user_extensions(struct i915_user_extension 
>>> __user *ext,
>>>           if (err)
>>>               return err;
>>> -        if (get_user(next, &ext->next_extension) ||
>>> -            overflows_type(next, ext))
>>> +        if (get_user(next, &ext->next_extension) || 
>>> overflows_ptr(next))
>>>               return -EFAULT;
>>>           ext = u64_to_user_ptr(next);
>>
>> I continue to dislike the layers of macros and specialization here.
>> This is just a fancy version of check_assign():
>>
>>     if (get_user(next, &ext->next_extension) || check_assign(next, &ext))
>>         return -EFAULT;
>>
>> However, the __builtin_*_overflow() family only wants to work on
>> integral types, so this needs to be slightly expanded:
>>
>>     uintptr_t kptr;
>>     ...
>>     if (get_user(next, &ext->next_extension) || check_assign(next, 
>> &kptr))
>>         return -EFAULT;
>>
>>     ext = (void * __user)kptr;
>>
>> But, it does seem like the actual problem here is that u64_to_user_ptr()
>> is not performing the checking? It's used heavily in the drm code.
>>
>> Is a check_assign_user_ptr() needed?
>>
>>> diff --git a/drivers/gpu/drm/i915/i915_utils.h 
>>> b/drivers/gpu/drm/i915/i915_utils.h
>>> index c10d68cdc3ca..eb0ded23fa9c 100644
>>> --- a/drivers/gpu/drm/i915/i915_utils.h
>>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>>> @@ -32,6 +32,7 @@
>>>   #include <linux/types.h>
>>>   #include <linux/workqueue.h>
>>>   #include <linux/sched/clock.h>
>>> +#include <linux/overflow.h>
>>>   #ifdef CONFIG_X86
>>>   #include <asm/hypervisor.h>
>>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>>   #define range_overflows_end_t(type, start, size, max) \
>>>       range_overflows_end((type)(start), (type)(size), (type)(max))
>>> -/* Note we don't consider signbits :| */
>>> -#define overflows_type(x, T) \
>>> -    (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>>> -
>>>   #define ptr_mask_bits(ptr, n) ({                    \
>>>       unsigned long __v = (unsigned long)(ptr);            \
>>>       (typeof(ptr))(__v & -BIT(n));                    \
>>> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
>>> index f1221d11f8e5..6af9df1d67a1 100644
>>> --- a/include/linux/overflow.h
>>> +++ b/include/linux/overflow.h
>>> @@ -52,6 +52,68 @@ static inline bool __must_check 
>>> __must_check_overflow(bool overflow)
>>>       return unlikely(overflow);
>>>   }
>>> +/**
>>> + * overflows_type - helper for checking the overflows between data 
>>> types or
>>> + *                  values
>>> + *
>>> + * @x: Source value or data type for overflow check
>>> + * @T: Destination value or data type for overflow check
>>> + *
>>> + * It compares the values or data type between the first and second 
>>> argument to
>>> + * check whether overflow can occur when assigning the first 
>>> argument to the
>>> + * variable of the second argument. Source and Destination can be 
>>> singned or
>>> + * unsigned data types. Source and Destination can be different data 
>>> types.
>>> + *
>>> + * Returns:
>>> + * True if overflow can occur, false otherwise.
>>> + */
>>> +#define overflows_type(x, T) __must_check_overflow(({    \
>>> +    typeof(T) v = 0;                \
>>> +    __builtin_add_overflow((x), v, &v);        \
>>> +}))
>>
>> I'd like to avoid "externalizing" these kinds of checks when the better
>> path is to catch the issue at operation type (add, sub, mul, assign).
>> Looking at existing users, I see stuff like:
>>
>>                  if (overflows_type(item.query_id - 1, unsigned long))
>>                          return -EINVAL;
>>
>>                  func_idx = item.query_id - 1;
>>
>> This requires too much open-coded checking, IMO. It's better as:
>>
>>         if (check_assign(item.query_id - 1, &func_idx))
>>             return -EINVAL;
>>
>> or other similar:
>>
>>          if (overflows_type(user->slice_mask, context->slice_mask) ||
>>     ...
>>          context->slice_mask = user->slice_mask;
>>
>> and some that don't make sense to me. Why check argument types? Is this
>> trying to avoid implicit type conversions?
>>
>> So, if it's _really_ needed, I can live with adding overflows_type().
>>
>>> +
>>> +/**
>>> + * overflows_ptr - helper for checking the occurrence of overflows 
>>> when a value
>>> + *                 assigns to  the pointer data type
>>> + *
>>> + * @x: Source value for overflow check
>>> + *
>>> + * gcc's built-in overflow check functions don't support checking 
>>> between the
>>> + * pointer type and non-pointer type. And ILP32 and LP64 have the 
>>> same bit size
>>> + * between long and pointer. Therefore it internally compares the 
>>> source value
>>> + * and unsigned long data type for checking overflow.
>>> + *
>>> + * Returns:
>>> + * True if overflow can occur, false otherwise.
>>> + */
>>> +#define overflows_ptr(x) __must_check_overflow(overflows_type(x, 
>>> unsigned long))
>>
>> I'd rather not have this -- it's just a specialized use of
>> overflows_type(), and only used in 1 place.
>>
>>> +
>>> +/**
>>> + * check_assign - perform an assigning source value into destination 
>>> ptr along
>>> + *                with an overflow check.
>>> + *
>>> + * @value: Source value
>>> + * @ptr: Destination pointer address, If the pointer type is not used,
>>> + *       a warning message is output during build.
>>> + *
>>> + * It checks internally the ptr is a pointer type. And it uses gcc's 
>>> built-in
>>> + * overflow check function.
>>> + * It does not use the check_*() wrapper functions, but directly 
>>> uses gcc's
>>> + * built-in overflow check function so that it can be used even when
>>> + * the type of value and the type pointed to by ptr are different 
>>> without build
>>> + * warning messages.
>>
>> This is a good point: the check_{add,sub,mul}_overflow() helpers
>> currently require all the params be the same type, which rather limits
>> their usage. Perhaps this can be weakened now that we're not using[1]
>> the fallback logic any more? (Separate patch.)
>>
>>> + *
>>> + * Returns:
>>> + * If the value would overflow the destination, it returns true. If 
>>> not return
>>> + * false. When overflow does not occur, the assigning into ptr from 
>>> value
>>> + * succeeds. It follows the return policy as other 
>>> check_*_overflow() functions
>>> + * return non-zero as a failure.
>>> + */
>>> +#define check_assign(value, ptr) __must_check_overflow(({    \
>>> +    typecheck_pointer(ptr);         \
>>> +    __builtin_add_overflow(0, value, ptr);    \
>>> +}))
>>
>> But yes, this looks correct. I really like it. :)
> 
> 
> One more thing, I suspect __builtin_add_overflow checks already if ptr 
> is pointer, so typecheck_pointer seems redundant.
> 
thanks for check in detail.
I'll remove redundant code and send new version.

> Regards
> Andrzej
> 
> 
>>
>>> +
>>>   /*
>>>    * For simplicity and code hygiene, the fallback code below insists on
>>>    * a, b and *d having the same type (similar to the min() and max()
>>> -- 
>>> 2.37.1
>>>
>>
>> -Kees
>>
>> [1] 4eb6bd55cfb2 ("compiler.h: drop fallback overflow checkers")
>>
> 
