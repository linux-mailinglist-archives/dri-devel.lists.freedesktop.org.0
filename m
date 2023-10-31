Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C7E7DCD34
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890C810E49D;
	Tue, 31 Oct 2023 12:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C61510E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698756598; x=1730292598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FOqISbxAY7C+Vp+DPLa8LwfkbR/Yqs5GJrePDfabeaQ=;
 b=VEYX11t8Mnb4nnNdkTPkaN8I1mjmtuQIsA33NpxIAdST1Pxix8R2pdS0
 cqlzXaIKxVWoLhNhogeI406C5tSD3mMYLY8IZCbMHZjVbhTtAt5HoUPCC
 eBrF4iJeb00HBT9BqP37VgG8vLPD6ouQ6t9nHn4q5echcGofocmjfaS2L
 R2GsJbrjjJbQWlDY1A+KifkLOuJ9c+d2xURCNzrd/3cFCi8Hh3yE142ms
 GXgn28YpD9SLCQ0p3gFuSovKFR8v6XFi2SZ13Y2k+CoJLiKYawL8q+qS/
 jYmc66qHyTKYxNDF6+a0jP04nNsySKnB1HnkSOWWmtTIu1HwbBU1g4Hdf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="392140863"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="392140863"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 05:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="831038055"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="831038055"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 05:49:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 05:49:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 05:49:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 05:49:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGJoBV9Usb8OkUxpwlY5Ddw1Ffhw4qg+9HPXc0Gh7Ke4oAKzbpoEeMc5rmzxnXCJ1YrM4HW7ChoynnRYNAtbTpVMnNK3S1u9m4zLb5ssPJqatnxqBB9K2SmBHnlCnwik70jDW45Bm4K3OCx2dx7Z7enhjE5AHeQsGWFpFIaADOfvxHufB3dZkBsOawqQES740QglEC2rjGhnW//bccTsUeXyarEIJvOWOWHPRGAkMrIYaS/1Lo3y/+jqhFPeglrNH4MWxHv2JdulmmgYg0O0AZFquBsZgAa5GJQ53VBFE2WmhbRR4f9QUMAf9P0kHBFofX6NgPE28X7dhbTDNRaqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EykNv8ohO/fGh+Ls0eIw16v0fDxp9QqBx/onSZD5/zI=;
 b=Zmq2+LflhA3bW5tZZDCwMdqqMlPFBgjmzgKimFGyz2/IJd3fn+v0wX8fKDdoIv51uu8dikUERSnC7omLnkwLgwiYWxg/nn37fCcbT3IzYDmSmdfSxYXfvzHv0jlfUkJmc+kup2oblQVLo8bqwnTFJagn7I6FyX8RFcJhKqIIjeqFlhyvDecNbFVAZBbji82IxZ5Q+ZdTh8y+VdqOCQ5uloo0lb9FKTRhcPPeV3LdL4oJjsC0JkG0z/MAKe8gWYijQYR45epGMRbfY7qPnA3Cwr+BCObfIQEknH/HXaXUUO2CYG1+BHC6GjExQPpRWcTnDVll72CaajO4yrgTHUQbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Tue, 31 Oct
 2023 12:49:53 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::bbfc:d1f2:512c:2f97]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::bbfc:d1f2:512c:2f97%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 12:49:52 +0000
Message-ID: <30434f6d-8bc0-491b-583b-6012a4985e41@intel.com>
Date: Tue, 31 Oct 2023 13:49:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 0/4] Improve test coverage of TTM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
 <c9d088c2-341a-b315-a15b-8b8c0d487548@intel.com>
 <eb349ffd-eda1-0f15-3803-2cfe5c01f2a0@amd.com>
 <c2fd2bb8-7c98-4012-bc63-2e143abf4f65@amd.com>
 <09724727-b5a8-2e67-0ce6-cc301d95e4dc@intel.com>
 <179d176b-47c0-4cb6-b14c-17528024cfc5@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <179d176b-47c0-4cb6-b14c-17528024cfc5@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|SA1PR11MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: bea3c842-c44a-409a-7e90-08dbda0fdfec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ccHT1ZBAmGkWOTlOSIdNNhPZLOCyZumPyh/VmkWAaK2/uRANN+HoFnwQUiTi+VGCOUJcDyzstdRW45yWaf0+rgu/Yr+FcKWFb+uLKDJQHz6AfoZb0HAd2Wfp9zVL1bWHgKIP5pUZOat3k6Z8/rlperl805fSBbgRs2q/ni6iPc9JLdqgVmCAGHR8Pt9kXhh9CkM+ckdKybtpCjHNLrYQDAD59zi2+6uIWZcoP4E/9BZ/8Gu1YL803CX1q/Wx2GCkjhH2iQzkWv1DuKvrK2RHDJtFDRzpyHlipNZfEUUcj6flfwIa5yZ23xXKvuxAWajt0INJsIiXQwtgPUOmGboUqDOi1YNV5ArtQXOV88tbUS42MVHQi1rn/Y7UQ/iosfJ3/5Fbz/A9JZowmGRSpr6MdoMD6+ANLMBxFx4AT94gNxAipSXtuU6XJjgTBHWJJw9v9zqzoDE91JkWsnu/HJXYe6r7lP5Mbh2KzeY/ds1ZnROfBi0vBZD2Ohi+IPoGsnYNQXd/dcpP4qbDNDpK+yHNT0xHIsxHl+42f/F/yxv11RxcjWu29uWt6V/g8mYOZ/leb6fMJCDAipZztbce3cmGl6kdYtPZz1x8eYuG/c7flB2gC3wr3j8Rlb6LiwJWpsmAs7+m2Bsa8nzNXmu1Xs3Hrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6486002)(26005)(478600001)(53546011)(6506007)(6666004)(36916002)(66556008)(2616005)(6512007)(83380400001)(66946007)(6916009)(316002)(66476007)(54906003)(31686004)(38100700002)(82960400001)(8676002)(44832011)(5660300002)(41300700001)(86362001)(36756003)(4744005)(31696002)(8936002)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnM5TTR5a0VBbkhTalMwN3l4MjVkRWxvRXZIUG54SERGdERwM2dkTnBVM2dr?=
 =?utf-8?B?RE5vMjdwak0zYVc5WGRIRklQNG4rLzZmQ2QxL0lGeUVqS3NGcjVXTFRzVHNK?=
 =?utf-8?B?RGE4eTJtNlpHcWhEZEVKbXlwUXV2RXVZZFlwSEw4ZVRDYzBpOHBnOE10NU53?=
 =?utf-8?B?dldKUElXeWRkYTZHcFIxY2dBd3ExWEFGbWlkM2FIZ1c4YmFZM3lOejA3enBi?=
 =?utf-8?B?LzZTZzVMN3N1Z0NGWmx2NWtzQStLNnFSb0RCZXlvZm5LVmpsODdUUEhNS00x?=
 =?utf-8?B?Q0RpbE1ObGpRRnhkeEh4MEhibmFJZDlSZ1NDN0thVjZJbFR6c1FBdTVMZmdo?=
 =?utf-8?B?NFU5enE3dzN2WHhST3duV2ZOQkgxaXBaSzBybzFyTjZZKzlqbHdFUi9WTlRR?=
 =?utf-8?B?Zm5PMTBteFFHVTVnNzdTMDhoRWRqUDRYR1YrMVRNSzFCaVk4UkNzVjZ3TTJX?=
 =?utf-8?B?cEpHUFlpNzIrTnRKY1piK3hSWUtPbUJTWVdHWFNXZi81MnFvZ25Dd24zbmZX?=
 =?utf-8?B?TzZTYVlWTUdxQW9HaHhCcERqWGFnR2VuY095NndIYTVXbHZqYnFMbFM5MS83?=
 =?utf-8?B?M3VqOWdiaVFES2s3MVVjbENqNDdLWjZTNDRXa1kvdkY3bEhxWVk0eDI5OWxZ?=
 =?utf-8?B?TnliUHluL2VURWlxR1JtNzV2cjVzMXJkRXc4NHdzeUZ6MFU0YS9UVGxIbUZR?=
 =?utf-8?B?bm1FS2g1bW5KelNaRU9wTVNIZVArK3RJWFlVNjZjaHJxU2Fud2hHMVozTkor?=
 =?utf-8?B?dkFnRjBtbitNQ0RqQVlxSEloZE5BMnVXdjN0a3N2bWRBeTNzUzBJaU1hczEx?=
 =?utf-8?B?aFUrU3dLUmRJaEFBMVZsTnJyVnBYV1pab2lnT0RJRzN3bkJxMFdUWDZnM2FX?=
 =?utf-8?B?Y2RhLzZZQmVURDNFdzl1OVBQV2RFaHFjM0g3SGJoMlVKQzhjOWRDUlEwNnFq?=
 =?utf-8?B?WXV5NkRBTkJEdUtQM3p2eGduOVowVnVRcUxHSzVOMzlTZWpYNkxYamM0eEN3?=
 =?utf-8?B?dnlieEdzcVZmNWdOQWlFOE9HMkVzdXo3R013WGRQL2RROXU2bloyZVM2OEJO?=
 =?utf-8?B?RFIwS0FnMklMSTFEVFhuSzlRUGx0cVBBZkpuSDc2blFXeVBHY0RqK0crL3lC?=
 =?utf-8?B?cnQxaFZ0anY3VWsyclQyRFI2SEczdkNPS0FHblhZWHNlQTJrT0hLcDFFK3ZU?=
 =?utf-8?B?K0FIUWJJL0ZFMXJuc0JMMG9rR3N4RlRHa0pTeHBQeUNxZndXb2plamNyVVN6?=
 =?utf-8?B?UUN3U2p6WnZoUkNxczBpakhMYUk0SjhXYi9BS2dVb2ZUWUNESXdwdUxhb1Ay?=
 =?utf-8?B?N0ZVY0phNXJZS09XSDVUSDJndEJUVjRJZDJMZ1hoMWtUY2tWRXlrMTF4TDEx?=
 =?utf-8?B?YzVYaTdsNURyK0FYWGJkcnZtQWxjTDNtdlljRDhaTXczdHBUN3hOSzJaT3o2?=
 =?utf-8?B?N0FDTy9JcXk1aTU2bU9RQnliTDdnYTd6WU95N2w1VWNhc0d3ekR6MzllTXFW?=
 =?utf-8?B?a0pyUlIvaXRwenRxYWJTUmpxakJKTEUwbFJCTEV0Y3JjTmJhMjlmWCtuZ0Ix?=
 =?utf-8?B?UVpzcE9SOTlzVWVJZW1zV0JPYjRraUwyMVY5aXNrVFMrcjNHSGRMcTlpVnBV?=
 =?utf-8?B?b05TN3lhV2pKYS9ralQzY0xtcDRUTCswNGJMUnhPTGp4QzJ0cmF4cW4vWUUv?=
 =?utf-8?B?czlCREJDMHUwa0czZ1gwWHkvRzdQWm9hZzFUNHFNZGR3SldRNTdZK1lIaTBn?=
 =?utf-8?B?Q0J1bDZiYzRHSzNna3RiR0lPSnMxMUNKMHZFRTBxTjUwdTE4VGl1bldnRDdF?=
 =?utf-8?B?Y21lWlVDdGNYcE94amRvSUZqeHVGUW0xMDZaWW8raVRjWVpLMEZDNlFQRTJy?=
 =?utf-8?B?NWFXNDJjMnhuNy9jY0RXK3VNWitNS3p0c0RZWlJCd0RMV2Vqb3g4aEFvM05i?=
 =?utf-8?B?VHBjZmZVRCtkbGE5ODNpNEVoWmZYa0VualRISWRHNzNJS3M0LzEwUGRWK0Qr?=
 =?utf-8?B?OFVhYitGZ3E5OTNvQ0lWTDJ1ZkswQnl5S1VNZkxXWmZDZkRsZ3ZyRC82ZUUx?=
 =?utf-8?B?a2sxYzNwenR0dGlCT2g4V1c4MDN2ZkY4dzRnNm9oeXN1Sy9INmJDUGVramhM?=
 =?utf-8?B?N0NtaFBocG5UWHhRdEl2UXpwWVRYVno1RGtxbWxscUU3bTVkVzRDaTcyQVVX?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bea3c842-c44a-409a-7e90-08dbda0fdfec
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 12:49:52.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saFrA4JY5wXIwxFPvtBCwd9SKoCdd/JkbfZKCqppSME8GALkgbeKFHFOj49iJAi+l32IdgG54xVmKTlmJsR3w7Y16hhAE9LLPaKZlWXlRBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, "Somalapuram, Amaranath" <asomalap@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 17.10.2023 14:10, Christian König wrote:
> Am 17.10.23 um 14:06 schrieb Karolina Stolarek: >> Oh! Could you at least take a look at ttm_bo_reserve_deadlock and/or
>> interrupted subtests? I'm not 100% sure if my solution is right.
> 
> Than this will have to wait till next week when I have some more time.

Would you have time this week/early next week to take a look at this?

I'm still working on the eviction test cases, but I was thinking about
splitting up my work and sending simpler test cases soon. I could send 
the new patches together with these in one series, but I think it would 
be easier to first merge this one and then follow with new patches.

All the best,
Karolina
