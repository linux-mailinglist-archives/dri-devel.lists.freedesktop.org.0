Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F5A74F823
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 20:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982EF89496;
	Tue, 11 Jul 2023 18:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0730010E429;
 Tue, 11 Jul 2023 18:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689101404; x=1720637404;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4vwKULe7GQUvcyhgxdJQcUSlV62ZvBeSqPlZK0yNz3M=;
 b=bNwXmgYcSH29rXAWgYLdFRmqf+MiXAq3BcgcwOVbOJTacZL7cCveFZ64
 iiTfHWrhdYVumWeciWQQRUS72snrBB1sspdkNgbk6HS3kNGZvQ74uQhKO
 oDNLqmcyx1TVPywpvlRyjPW/SskpYl7QlHMjkWJfFVaPFPYwb/Gd5OGnt
 Kht3WtLsJ+196yxccIBN+znz1g10N5Zt6heUMUrkIB0e7McsvYWwC0AnI
 i/NjcMoh/WyVqzA65oZq0us6Ee6wu2ptpoUaCosCq+Uzo+wQ8ZnEyHoGO
 5BX8Cl21mL/leDTjs1hSJAyadKBfOiz6xIsNSlXGXZGt9w9Z7ahqwVU1p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="349541759"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="349541759"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 11:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834819031"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="834819031"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 11:50:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 11:50:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 11:50:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 11:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmQbOni9vV/pRmKtzYrpG3DpYE90mzxXemH49LVPfkz2lhVcMkYpdGTqfuK2Ccgn3eSHVybcJMzoyTB/65jqz7MOWh4NWMel8lvu7b7RNC5+umNqKVJxKUoX/ZKVVCP9+bfP36lR3I7vUDp3mzJfiXj2EOiDKrZN8YRw2fzDYh0k5bx86/kp0SXHkGD7MZ5bNRHxYlx2T29SsLyki8LBdYXvXgytN5SNvDbfaiHDVDmjCnGkkk/qzZpI1syaHx/M6+lhn7NeInp7K5PdEcgDCwM0Jf5aDmuMdKliWs9ap1TgGewqxs8558COb7EN013OADY9dfAe2owx9qioQw4PGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oTgjekyBrrT9lJ7DcumCWaevxPgNTAn/95eXL82eIU=;
 b=IBotJiHWOLR9rluIPzA2Bg9cvDfgOEKub6hgJsy0xDdc/gc85vClTnNqPRrQtzIvsIJCOMPs8iDGwQPKEaoUmlkinpAWDZ3z795oIADl/Erb8pZV6TbEyObmppOL5bnDlcJe0HUk2eGtv9vvUbs3j1z7GYIvv9aDiRDd5Um3z81mNum1C+yJPGCbqtQUX+xrzkugOzj4sUE5p05jUPeK3tEj8eaUpnESShsyoRQsPHPnET/ujwvvzUtR5g7HolQkkNRA1oi1nWuM66h8VO3JVo5syNb660GV8L2duqzk5zyQULxUjqfTyUkPwrBfGHSYtyLA3Ldy6/IamMsrJDMuPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 18:50:01 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da%5]) with mapi id 15.20.6588.017; Tue, 11 Jul 2023
 18:50:00 +0000
Message-ID: <c24b73cf-34e1-f7e3-b77f-da853bdd56ef@intel.com>
Date: Tue, 11 Jul 2023 11:49:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230629204248.1283601-1-alan.previn.teres.alexis@intel.com>
 <29d9e289-42f8-8ae2-ad2b-9ddfe8c848cc@linux.intel.com>
 <20c097ddcc2eb63f25a766becbcd0d779855afe5.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20c097ddcc2eb63f25a766becbcd0d779855afe5.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e85ba0d-b4da-47ba-965e-08db823fa180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jDkmOiEPFTxBVlJ6ub2pNlIukNfzLyD/1/EAO7RtuqaH6OMs20w4jbSK240mNadWvyXzBTkwuAVX7o3p7/DVmQ3EW40aRQDFvbtjo1lVU0OrN7AkIma3q7iXsMCVjWigC4kI3/LehZ1ZP4pKr47vAJdJUpCuRsJADk4SkaMnTyXJ8VJqQkSwbm5Qhclf3DyupO0KtRSZuRiZQf2os6I2bnXytjCqg1+QEBUSapeGKrXIonE7FV/2Ob5ymVtd4ugb/IotFY2fO6OOEi/nvhHiM5nqiAVuEJjq9+zwHc+lgdWJK+/64NK32nN2YgWG5k+ZPMqYH+p6Ct8sRNQ2p/dA+nBp1kGc4j7zIlt+TtER6mi3rpMdx/11gpmW0PKpRkYZs6AkbT4Ul/tq/s0b6FPjpdO66HLXReEdwrTg45FOc7O1r/GsOZLDM/ZUileE42vFP5/mw4j6yv9RJzD2Pq+hHh8XB5SSlIr/vZA0cnoReEqlCPWD4E/b9bkxHimYlVKjv6j/ndPZcBMOdgfmtcSrTPqSunRFrkpVI7I9VXyGGL5qbEBNEdQ/EMdMaaFJP/ziXxVq7yxaLvPokiwikH0dSM598TUUxdHqj5BA39Su9K+j+i9T3UPNnrihYqczwkcBD+5Is9Ve2hwe6TrYdCPBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(36756003)(86362001)(31696002)(110136005)(38100700002)(82960400001)(478600001)(8676002)(6486002)(6512007)(316002)(5660300002)(2906002)(66476007)(4326008)(66556008)(66946007)(41300700001)(31686004)(8936002)(2616005)(26005)(6506007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VlNzlmUEVXUS82Vld2OVRrN0krRmtZb1NPQjlzcWNLRHpmbXJIbHIzM1VY?=
 =?utf-8?B?RXljWkpPQk1yZ0FFc2NSVVVuVUticzRDQ1V4M0NmVG1vc3Z0NWhPMmdHdHNN?=
 =?utf-8?B?RVJ3U3RRck9tM0h2OXdnNkVFYnIraVRIcjBhaDFOUmFIMnQ2b2RCaGJaMkN1?=
 =?utf-8?B?NmxYQVplZm1jMW1xYmxvTGFEOXZUa2ZZeEY0REZhZURHRHNzK0hKcGd5K0lu?=
 =?utf-8?B?RGtGWm9RbEM3dXBjeGhYMklLcjVJeklrZmViL2xKWThBazgxbXFmd00yclQy?=
 =?utf-8?B?cVhLbWhMbTNLbkZITEtCTkFrM0k4MnhDZUphSy9IL0M5WW1zVFFhZGRwMFdI?=
 =?utf-8?B?WDN3VGVnbDZyWmRMY0M2aHF6bWpMU1BzNTVaUVZVbHNzVi90NWhveTdrRW9J?=
 =?utf-8?B?Vnk0TUN6VDNNcXduZmh4R3RxVzgrTUVvM1U5MFdqZm9CK0JsMk5ERjBCTnlu?=
 =?utf-8?B?VEYvRkEvSjdXTmlEcnc5MDU0bEtDYlYrWVV2b0dMSjlwTHNQdFlUUFFNaGRE?=
 =?utf-8?B?S1pYZ2VZeXpnelBXeTJoMkIxZCtzV1BvM2lJVUtIWm8rcFNhanVEdjZZUUU4?=
 =?utf-8?B?VTgyQUYwWWZrOFdmbFI4eTA2cHgxTHNkUFMwT2VKUHVTK0pwdzBneHFVaStD?=
 =?utf-8?B?ZVIwVzBIcGRtdkNZelNhUWNNTWRkWHlTKzNSSkpPU0xqdlZnVE15d2txbXYz?=
 =?utf-8?B?NHhqb1RkWSsyMlUrRUJkUnRveFVjeTc0Q0dqcERQUlVHbVR4SjhLUWZMaXFE?=
 =?utf-8?B?bzRZbW5LdVUvYkk2MFNMSC9kMmlyS204Sm1Ic2hXZEROTTNYMGt4aUJZRlpX?=
 =?utf-8?B?OUpJcWJIRm9GanJ4cW5OcjNVQnA3SVVJMmllQ0lZQm9NRFdmeGc1bmR1UjMz?=
 =?utf-8?B?anFZVDBMU00xTWo3OXAxSXpjSy9CNk9SL1p6bldrbXlpTUF1V3hidUVxMTIx?=
 =?utf-8?B?V2MyZ2luTDEyNEszaEFOQVFHRENnaWt5dGpjTmVVNkZvSjB2MWZoVEswdGNu?=
 =?utf-8?B?M0FITUVoclMraE1wdU1qZ05zQjRtT1dwaFZoajRCbEtmYllxb1g5SGRGeklI?=
 =?utf-8?B?bndzanQzY3pUeXZHU0JvL1VKa3pDeEF2ZEdBZVRtdTZYRVRRakNJUHNLeU9M?=
 =?utf-8?B?Nm02bmZubVMrRVcvaDV4bUFLMENVV0Y2OGlVZjdtb1ZNdXc4eVRHd09yQXhh?=
 =?utf-8?B?NStNZ2I2ZDdNK24zazhKdHdManBKRU5sWWxnek5pdCtZaThQOVk4WHRNK3gx?=
 =?utf-8?B?bFlZYW03VEhTcEErSms1b2duSHQ5UktBb3U2T1BNRzBwVmhxZm9IbEVRTldt?=
 =?utf-8?B?UXJLMnllcStVVWp3QVNwc21BZmI1MTR4MlZzcG9Sa2xidyt4d0p0ODFUbjRt?=
 =?utf-8?B?U1ZOWVkrcnl1UHhRWWhqNnZ4dnlhMGEzWUdSYTRROVFOVjlKTG5WQllwajln?=
 =?utf-8?B?eTJSL2gvbmVDM01DQzhZL0hpVXJOMlJnNHZCZ3VoWnRqbHYyMUZZZXlRTXpo?=
 =?utf-8?B?c1ZqdVRYbnVLSGRBQ0MzQ1hyeVFRdVpNV2N3WXBTRVpIMkIyOFdrZDdNM3By?=
 =?utf-8?B?YTV1ODZieTNQSElwRnV4RHROUUNraEFOVnBnZWNmczB1dE52RU56Yys4NmRj?=
 =?utf-8?B?aEpkaDZWcGJiZ3c4WHNtbi9SOXA1NHFheENVMXNVMUpYYWRFbkRzaXo5ampQ?=
 =?utf-8?B?cC9xbUhERHJSTUdsLzhuQ3IyY2o4UHRMU2lMck9pdXh3cnFJSlY4Z1hqNUtG?=
 =?utf-8?B?VTJUcHE1VnhTSUpieHQvNVcwVWVBT1Bmczk5eXR1eTlrU3N0MzkycnRCWHR1?=
 =?utf-8?B?UXdLYXJ2ZVY2VkdOSU1qK091ekV0cTBIMFBuZTNqbUhReG1ONG40VHIyVlpY?=
 =?utf-8?B?RTZaSDJEc3pPdEtJNzAzK3pMZVlmMm1tWTd3VndERzdzdVlodkRqM2FjWmhi?=
 =?utf-8?B?NnlTUjJhVEFaU291RndjUDdkRWU0Z3krbDJnVjlUNktNc3NDQXhkYkFMd2VP?=
 =?utf-8?B?OHkyNUsrQm1nRm1TeDFtMFZ0a2MyRnBnejZTYkd1UnR6eGpYYzY4bGdtUDlK?=
 =?utf-8?B?cHhDekl6MjhhdENRMW9OQmFrT1Zkbml4ekhmYlNLMDlBR2cvc0lHWUZxQUtV?=
 =?utf-8?B?M0JyZ2FwSElKdTNGRUxHeFRIZ3dDL2NyTUxOTXNhV0lrdU1FaHNtWG5jVFBW?=
 =?utf-8?Q?ns2wCykSX33riBYi+MU3pT0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e85ba0d-b4da-47ba-965e-08db823fa180
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 18:50:00.9194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fyp0tjIneW8IlM9iFXecPr1zncdEUljNJCtIRp5C/jSB6a8KyAt/5TPQYJcSvfRGfNjG2UZGLZKEWXxdD1TFxU/hO8B7pjPWrfhXfFDywBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<snip>
>>> @@ -134,6 +193,8 @@ static int __run_selftests(const char *name,
>>>    {
>>>    	int err = 0;
>>>    
>>> +	__wait_on_all_system_dependencies(data);
>> Why does this need to be top level selftests and not just a wait for
>> intel_gsc_uc_fw_proxy_init_done in the tests where it is relevant, via
>> some helper or something?
> Alan: it was an offline decision because we didn't want to repeat
> the same check for all permutations of selftests' subtests (i.e. considering
> module params can dictate to skip some subtests but execute others).
>
> Anyways, let me get back to you on how how many selftests' subtests actually excercise the
> need for proxy-init to complete - if its just 1-to-2 subtest I'll move the remove the code
> from here and move them into the individual subtests.

I don't think it is going to be easy to figure out which selftest are 
impacted. All selftests looping on all engines of course, but also tests 
triggering GT resets and/or messing with the system in other ways. Any 
new tests added will also need to be evaluated.

IMO there is minimal impact of having this check on every test. When 
running selftests we load i915 after the rest of the system has already 
fully booted, so there are no delays in getting the mei component up and 
therefore proxy init is sometimes completed even before the selftest 
code starts; when we do have to wait, it's usually for a very short 
time, because the expected total execution time for the GSC worker when 
not having to wait for the mei component to load is ~750ms (~200ms for 
GSC load + 20ms for HuC auth + ~500ms for proxy init). Having a few 
seconds added to the total selftests runtime is IMO a better option that 
having to maintain a list of impacted tests.

Daniele

