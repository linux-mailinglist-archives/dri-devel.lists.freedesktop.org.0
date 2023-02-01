Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27322686E37
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 19:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E615610E195;
	Wed,  1 Feb 2023 18:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D686910E11A;
 Wed,  1 Feb 2023 18:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675276668; x=1706812668;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5wk0TO81aLkRFrjIAqxQij0keO/PwPz359jXwu/kBeM=;
 b=IUE/KyA1/EdHr7Ooi1584/Kh54F2U/oFbBcNcgd3I1tnE+kxTvbc4mWz
 zX93jte+1sWsV+G2jngoyvZRLgTyGFPq2N+eyH5tmiD8PCw+Mmc6GIibn
 S+E1RD5bFB3YixJCZg74OMh/IfHQGI9EpsETlsAkbI5PkF66q23+sco86
 Br00LyIsMywOSV3HtR6yQRxIX72aPwAalDUbGvJ1Tk6Qcry7QtYOfK0qN
 wYh8shIJbKFgLQKc7Uc35iHYa/mvNvMERcWlE7gtNVXmw5Qh4ab6cTQYh
 fecNGfzZNWob64Z65TPngWz0pak+MEPaubCAY2ZBfREnI/H0TkRtdsI2F w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="307894425"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="307894425"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 10:37:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658423227"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="658423227"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 01 Feb 2023 10:37:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 10:37:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 10:37:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 10:37:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwypWFd7d2gEiE0HJ3V92yaJWX7h+Ukm+mRgiz5wwg/AMdvKMqVvnig43+iwj57OFddSj0qqFCYsuv9pZOAKjSwf/oq4yYZ+uNGGpt9y405WqMqBleELRZNZGFciRapQFr/wJzlIR2pRHSVAqVEEwfzvORIwzTT9T1uxH9yUEyqwCAlVcPjKbQall3hqjLku1+WF9zUvkakgDeRaL0cZ4RA9AgPPZkHDXu3x8CbZsXqShk58zPqtoFpBf6wwXtQu7Xz02M2BRiCB9QTchIdY3XN7eeEGmXGf9VNH8HXm8jzujg2TNDcS6QH/wfV8HD9zW5e/0DD/jZ0indRVr+oqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhO+t6GofvxsTsiew10gG80l6WZgM//poFXZSHfkUMI=;
 b=DoJp9AuHUi90PL8uAkEi6hwkhpqfjbCgex5oInUsY8U71LhNSKVAn6cv9Kxx8zJdyWyIP3Vmbj6B8usX9wCPeBInU+7ObSyhvScnwnz11n0i0aGNKZKTj1g5/l/PWOgGX7YrAflD6HojqP7gkykwNMAK0AZXDPuAX6QIu/NyMwYXQdKxYa+7Es2h0tJBy5Ae0yfs3DYb8Jdbi1BKKW2Cun+4PUA0jJB+ix7V8hWBCdym77KfmAirfEP3q0xURIRtZwv1SOTdUw5uHGMLES4CXd+A62mU233zu8BL8XBJHWJEpsb2fSZFl4XlNZ0yVWXZLWmJbcUX5WIC2XQbRpHt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.33; Wed, 1 Feb 2023 18:37:09 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 18:37:09 +0000
Message-ID: <fed121a6-8ad8-676b-ff6b-f7c6611058ca@intel.com>
Date: Wed, 1 Feb 2023 10:37:06 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: linux-next: manual merge of the usb tree with the drm-intel-fixes
 tree
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
References: <20230131130305.019029ff@canb.auug.org.au>
 <Y9kNRVppj5Uxa9ub@smile.fi.intel.com>
 <9566dc52-2ff1-760d-c9cb-fdfef9278f05@intel.com>
 <20230201151113.22382269@oak.ozlabs.ibm.com> <Y9qFmmi2C20AFQB7@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Y9qFmmi2C20AFQB7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM8PR11MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 630631e3-db5f-40d0-2f2a-08db0483531b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsE3zF9q6JijQ7W5dGwkDM619m5+DK+V2AMY5diF7qPAyjM45y0goB/yHB/N4XW5ROATtiG8Pa8S4mAMjrB1fLiylDAwnLVxFsKvQWsXkNVEj/lV5TPm8tP2eqbyM9Pk05v/7VktD7GWVtMbwogIZF+1KlCUSPGVYZ/yPweyo9B8GyIbo3tJIVGnVmvaK4QkXoSH1C9tfHJubECDlDq3yPiU93xJ9w/c1H6y36EBqgEyW9P7fAIpNjEbzPDvXBVU/GFNkMX9bIJ/FsDZJQdAiUT0ElcFgJx76zow4kSmFDxALFXjnAMJsLBcpe9F/Iuu/A1iPAq/+HEqIViwpVzO+eV5cFfd6eMvM8NuWgi40kxmWVhhlVrpyruRRdR0UbQ1V5MGD7BdGKV+L2HDgyA+xEMoquDcCfd80p7nSbAblKTNq9azJMIyEjimpnfXf2+vjyZv76SjY+JgOVH642tRarCm2eGSeOl+253Jg1+Lv+pCClwkLzUs+nWD97O9DxjQc/rWQJvBb6jvoC4dVFLJnMe17p1H91D9N7R06TA1zZLeqPue6S6DuNVbYS0k6pXSxKcIgGmfHX9y0CYzCp9nHL8XZAexE8Ob7Q9c111fmFZEh1YkRwjXPcN8UpwSrR1fF//ZLm3mMgWSRcFQ3dyPrhPVWYm/3xfJYSgxJjvJWCD+hNtt+mWmV+3Exp5h5sae5Wi/ymq5Q6oSeClNc+3xeCXCLkRn1S3wZYWHttG2sCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(186003)(66476007)(41300700001)(86362001)(2616005)(26005)(83380400001)(82960400001)(36756003)(53546011)(38100700002)(31696002)(54906003)(316002)(110136005)(4326008)(6486002)(66946007)(6506007)(66556008)(6666004)(8676002)(478600001)(6512007)(7416002)(2906002)(8936002)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJaY1U1Rmw2VmgvUXhBdWJkY0xNSXhBMlZidTMyVjcyNEVmdEZxeExYQXRB?=
 =?utf-8?B?L3dPbEp5bzJzbDVQQ1o1YjZvTWZZVVhYQmlBMkNvVTZPbVEvYWFjK0padDA4?=
 =?utf-8?B?MjQ5SEI3MVVtdEtPQWJFK01mam1jTDNGM3loWnRoRzBBMlo0SDRySkpTS2xu?=
 =?utf-8?B?ZkRtU2tCT0RsbjdqZXVxTndLT0dWMVdQd3IrU2ZxWWdtSUJUTVVMb3dJMmdK?=
 =?utf-8?B?TzNkcW1GTWc5dithbHBNWnNDelNYc1ZLODNsSmJLV1Z6ck5JOTcyeCt0ZUcy?=
 =?utf-8?B?N2I4YVFMMW5meXU1MHM3cjc2YktmZ2ttUXZ6WFVIZDJZMmpsSzljMkFDeFhs?=
 =?utf-8?B?ajhiUEtFWUpaeStWdDE4QldheExWT3U2Zi8xdjI5MXA0WDRGUWRMbkRRVFhm?=
 =?utf-8?B?eS91UWhaVlVnV0pDcGdnS2lkYzREZzZyWHRvSGhEd09OR0F0cVZmUmRzRE9C?=
 =?utf-8?B?K0JmN3VSMGUyWlZQNTdwcTVhejhmY2xEYlVkdmttSTJ2dC9IT0s1NXAvcjJN?=
 =?utf-8?B?d0V5ME84SWRWWHYvUGh5SVFkUzlNWFhJVWNJdDI1TzgwYWpUSFM4OFZpWTND?=
 =?utf-8?B?M2RFRmRJbUlNZUM4WG5aWU9yUEsvWnB6NGpWNmw2a3N6NkRwV1R3dU9HVEZs?=
 =?utf-8?B?V2NhWnpnb2NKMzZTL3FXU29WYklpREt1RkwwVzRrVEdGeEozalNEaGNzQmdH?=
 =?utf-8?B?eUdxZWdlc2YrWFdlaGJWb1gxZ3NKSldXeTk3endjM2NIaWlKWjBZaW4yQTI1?=
 =?utf-8?B?Zy9aVkpiTEJpOTI5TldpcU40bndmUU1rWEtNNUZUbE5ibVlOc3g2MndocjZt?=
 =?utf-8?B?MjI4R1I5Si95VTB5VUFkS2F1RHdQc0tIcXhlbk9rZFNlNE1ZeGplRTFuVnEr?=
 =?utf-8?B?T0ptQ2s5eXhIOGFLQ01uYjlVR2hFam83c1J4Mm41TFpmdUdVYjlHTUFrdzh6?=
 =?utf-8?B?bmI5VzRiUXFwR0xXdktZZ3N4Q2F6My9iMzRGNHBKcjdwVmk4TFROUHBNNW9D?=
 =?utf-8?B?WWIxT1Rhb1RIVWZrdGNqRS9ZKzF5RVBYRHBUM2xMV0lJNHoweUlsMUkxeXhh?=
 =?utf-8?B?NUdCK1dieVE5SS9Oa0hPSllmbzhpemliQkJ1TEM3MlhtYmUrcnM4NTc1bWs1?=
 =?utf-8?B?R0Qvc3AwSzdUK05NS2VYWjlLVmZIQUlFRkdkSysvMGV1OVZGZUJHTTluRWV5?=
 =?utf-8?B?cXEza0IvOU5Kb2U3U0EydHk4OXY4U2hPbStGdnNNcVJoQjdSSXh3ZDVNaWNL?=
 =?utf-8?B?aEFGNDcxd205dzU0emNHa1VHOWdVb1JGM0ZFNGxhWjJxMDBleTFtMG82RFJy?=
 =?utf-8?B?Z1ZhMWxMdGRqWkpHZ2tWVVdMQVEzMUpmNFJCSlBmWXRQdGExSnJ2L09nQ3NP?=
 =?utf-8?B?L2JZMGxRZEVVd3JBVjVYUE1pOFhzM0EzdGV0a2VaVGdqZnI5TGJuRkd6OERk?=
 =?utf-8?B?bGtpZUY3V1JyRm93b3pDSDlTaVpiWjlMVmF5RGZQTDc0cG1Vazl4bmxlZ0VP?=
 =?utf-8?B?aUY5aSsrUXhSTkVrVEpSOVhJczk1SE5UYmJUbm42aXJTdVhhcDVLTTdnbWRB?=
 =?utf-8?B?N3l3b2h4SWszRld2NWJReGgzQUx6enFSQUNxbXByNk52THZHMzhIdmp3WWpM?=
 =?utf-8?B?RTRLaDNFZjJOQjF0OW1mMkZzT25uUTRqKzlkS2w5Vmx2K0dBRnJ6aUoxMktG?=
 =?utf-8?B?UTNyUCtpYkk0Q3ozWnplQ0dPc09nOFA3TzEwRGlkVUZTVU90Mlk5bDFFLzdh?=
 =?utf-8?B?ZW04WmdLeFNYaGQrOFF3VjZQa2F5bG9mUTNyRng0bmVkY3kvUk9SRGt1dlhr?=
 =?utf-8?B?K3FxeVAxZHVOMU0xMnlnY1lJS0Q3Smw4VFJaMkhQQzE3MWtURkVla2EwTHhn?=
 =?utf-8?B?d2ZRQVdjZ3l5T2k1Mkw5b3M4VUFiWXo0VjFWMGhuVXBnRVUzS2pwWXAwWUpM?=
 =?utf-8?B?UU96NFpaT001dnp3Q3FuWGFlOFNFekVxMkduL013QVNDemo4eEFxNTVhMTNv?=
 =?utf-8?B?NWZHSU11N2dzam1TUGo0ZTlVVEk1V1R3VzQ4RURoRUcva2dTZFNPM0FUcDVC?=
 =?utf-8?B?dGZVamZWc0dyTkJ2SjR3Mk9aZ1FuZlBXYUJ5Rm45TU4yZElDYWRrVDVXZHBS?=
 =?utf-8?B?Y1dxc1JRZWJIQ2VXdWVaUDdXSU40OGVmQ1QxWWtqcDlPZWdIbFFjeUV6YjVo?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 630631e3-db5f-40d0-2f2a-08db0483531b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 18:37:08.8480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcW0HavHYiiTVVTx2bBr8RUx7vgv2L2jQU94EuzTz5WzCOHym4KX0JHJFnc9lDtMiMM1Kz2mFnXr7zwO2ueey0am55Kt/jk2hEhMarmxQgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5590
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Greg KH <greg@kroah.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/2023 07:31, Rodrigo Vivi wrote:
> On Wed, Feb 01, 2023 at 03:11:31PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Tue, 31 Jan 2023 10:27:29 -0800 John Harrison <john.c.harrison@intel.com> wrote:
>>> On 1/31/2023 04:44, Andy Shevchenko wrote:
>>>> On Tue, Jan 31, 2023 at 01:03:05PM +1100, Stephen Rothwell wrote:
>>>>> Today's linux-next merge of the usb tree got a conflict in:
>>>>>
>>>>>     drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>
>>>>> between commit:
>>>>>
>>>>>     5bc4b43d5c6c ("drm/i915: Fix up locking around dumping requests lists")
>>>>>
>>>>> from the drm-intel-fixes tree and commit:
>>>>>
>>>>>     4d70c74659d9 ("i915: Move list_count() to list.h as list_count_nodes() for broader use")
>>>>>
>>>>> from the usb tree.
>>>>>
>>>>> I fixed it up (the former removed the code changed by the latter)
>>>> Hmm... Currently I see that 20230127002842.3169194-4-John.C.Harrison@Intel.com
>>>> moves the code to the drivers/gpu/drm/i915/gt/intel_execlists_submission.c.
>>>>
>>>> Is there any new series beside the above mentioned that touches that file and
>>>> actually _removes_ that code?
>>> As long as the removal is limited to list_count/list_count_nodes,
>>> that's fine. I only moved it from one file to another because the one
>>> and only function that was using it was being moved to the other
>>> file. If someone else has found a use for the same and wants to move
>>> it to a more common place then great. I assume there was no conflict
>>> happening in the i915 specific code.
>> I have added this fix up patch to linux-next today (more or less - this
>> is a hand hacked version, but you get the idea):
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Wed, 1 Feb 2023 13:13:01 +1100
>> Subject: [PATCH] i915: fix up for "drm/i915: Fix up locking around dumping requests lists"
>>
>> interacting with "i915: Move list_count() to list.h as list_count_nodes() for broader use"
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>   .../gpu/drm/i915/gt/intel_execlists_submission.c    | 15 +------------
>>   1 file changed, 2 insertion(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 3c573d41d404..e919d41a48d9 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -4150,17 +4150,6 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>>   }
>>   
>> -static unsigned long list_count(struct list_head *list)
>> -{
>> -	struct list_head *pos;
>> -	unsigned long count = 0;
>> -
>> -	list_for_each(pos, list)
>> -		count++;
>> -
>> -	return count;
>> -}
>> -
>>   void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
>>   					  struct i915_request *hung_rq,
>>   					  struct drm_printer *m)
>> @@ -4172,7 +4161,7 @@ void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
>>   	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
>>   
>> -	drm_printf(m, "\tOn hold?: %lu\n",
>> -		   list_count(&engine->sched_engine->hold));
>> +	drm_printf(m, "\tOn hold?: %zu\n",
>> +		   list_count_nodes(&engine->sched_engine->hold));
> something awkward here.
> The resolution on linux-next should align with the resolution on drm-tip
> where we have the list_count still there as we preferred the version
> on drm-intel-gt-next as the resolution of the conflict instead of the
> fixes one.
Not following why you want to keep list_count as a local function in the 
i915 driver? Surely the correct fix is to move it to the common header 
and share the code? In which case, the correct name is 
list_count_nodes() as that is what got merged to the common header.

John.

>
>>   
>>   	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>>   }
>> -- 
>> 2.35.1
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>

