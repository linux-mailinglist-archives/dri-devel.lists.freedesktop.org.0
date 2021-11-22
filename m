Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AFA45937A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 17:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6088A89D84;
	Mon, 22 Nov 2021 16:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3771B89D58;
 Mon, 22 Nov 2021 16:53:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="321052881"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="321052881"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 08:53:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="552579166"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 22 Nov 2021 08:53:46 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 22 Nov 2021 08:53:46 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 22 Nov 2021 08:53:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 22 Nov 2021 08:53:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 22 Nov 2021 08:53:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Em6XqyMNT+nwPEdhHlOSa81d+uHfXDsi56jDuNAF/lhLmOauPHDLnY5dmMKjeOK8sugoVIvJFRGznQ/Gg/rVBvTzLWOvy7l+zTPx1yRKLJAH7SXB3g7eB3OvzwFlGYLX+49KS41Tkf1a3aB8cLtd8wBVJ8lH+11jwKXhYfNRnbiXmW6Zt6L63dQ4CPDb/lhowFNb9/ZiOjaUWqurc+PKazXZsieYNN1REHAxPaT/8hFVOwHJ8YdkbbqmtvO4rnugNpgryNLIIkflO3BgWhAASy0rYa5td2Ou3z50YYAUfnZUtzJbFYFFJni0wncea25kKWY+VlacdJxUDtxdf5aYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x36A0SDpDLXJa8Lgi2F1hn5NHWYuEaS8URDmWRVZUEk=;
 b=SUnbsWk0X/FAV8Tk2F7P8wxls5L+L3YXvWAWW7SGpd0KGZO6kox7RMFb+El66SVMMyc1iGYRflnNxoSuw4o+6Ftw+w2Fd/HpQP2jTfJRyc8BAvCh7jf9HlKBq+qLFEjmDrn2MTg5DzxtCZxWkryz3DJm95drtdb6msOCwcWBThHzR9FaMLVusbK7jXZyI0hA/iH08EPgRbfHCYSwpR0tXXEYsBxq5HGCmTlx0RNnrS4Y+Bnb3g45ZneBcHL2jUsiwekoxAAypuPAqrCXMxPsp29HGwHnlX4mcjlgcAWNaGLsFH02yENaPL5zoHliTLnWuN2rXa+gNt33JeJkIYwo+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x36A0SDpDLXJa8Lgi2F1hn5NHWYuEaS8URDmWRVZUEk=;
 b=XVFhDCAJV8y9I6iatTTBP2BmOeHIigC6iHFphfWcx8u8kdgRqYPPMgQr0SW0HChW3xh3bemQxw+WR0Vf9KNiiGf9IPV/CMrbPh3ZqlDJVZ6D59LpvKRiZPecejYrtihEISc7UEcM3oOCEFddrRkaGi1ciDbTVmvute8xRPDb3U8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB3546.namprd11.prod.outlook.com (2603:10b6:5:13e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Mon, 22 Nov 2021 16:53:41 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::a5e8:312c:b70:a2a5]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::a5e8:312c:b70:a2a5%4]) with mapi id 15.20.4713.022; Mon, 22 Nov 2021
 16:53:41 +0000
Message-ID: <454da641-c065-132e-174b-4e6c9d7db83e@intel.com>
Date: Mon, 22 Nov 2021 08:53:38 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.1
Subject: Re: RPM raw-wakeref not held in intel_pxp_fini_hw
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Vitaly Lubart
 <vitaly.lubart@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>, "Tejas
 Upadhyay" <tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <CAHmME9pShXywMogVkcBsXtfKxFHmQLe0F9cMF27aveUz6iyWhA@mail.gmail.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <CAHmME9pShXywMogVkcBsXtfKxFHmQLe0F9cMF27aveUz6iyWhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR07CA0016.namprd07.prod.outlook.com (2603:10b6:a02:bc::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 16:53:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55c0ed48-4c16-4a8d-8ee8-08d9add8a373
X-MS-TrafficTypeDiagnostic: DM6PR11MB3546:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3546642F17160DFEC3A52D8AF49F9@DM6PR11MB3546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLNICOC83Yxw1UM3tlqkOTzJVxAqnXrPDZ3ywdJ9LY3QmHAYuJ6HFwhbaYHIWdOvzUv1CdRJjDtzV/YCgpffGAhLq+PalSCknViq8Uq6z0AembfyuFDUe0Mxs2f6RCTWtNDCNsPgP8Ar6PJGpDo0kSRST372ZijXmOIJBDt79/sC8WgxeVm78MqjExXx1Hf93oez+O0oAyUPrlTXDvVBAcqRykNd3cmnrcrJ5h4PUBXh9+JNPLpFdjUQKtgDuovdAvQC+6aOb0VTaoYICNzJGMwp7OrN8L0y9X08fDSj/GViMH8Roq0csAZzjkIebwGgLaw9gPRM3zpSK94G8M9NhXNeg9oR/rscwz6OarOWyVadYBwu7YHmUsURFIF8P18N5Ec2NYv0k00OIju0UZXjfUWUnA/XFVheY8JDFFaJ9GDvW6KJZZ/j1ENuaT0+8CeBK7kujDkWzaPUFE3DqO83bjd3kcGKjoJfaKGpE8ByFapJX5JZHnOaVtKjhz7Yv79FpYmsKguiI7F3sWoOVCnajQEut91btENx5WXWZUSBEnY8oziEZyqa8vMTGuHiitHqoY493E8/NQmk7l/7s0Yefyqn+ZFEtgGLnRKVbHF3dlNUfQ9HOF4u3mHFGWSuPXR7N2tNJg+QuuQnJOVj60kOHy91QDq9FqnvHgrNOKw8whI2I8RZ1rch6YTDbOm3wfGKiDwI9Z57hwCkAtoXtAW7notTI1c0Yu62qKHjbM4In1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(8936002)(31686004)(86362001)(16576012)(508600001)(186003)(26005)(31696002)(66476007)(54906003)(110136005)(956004)(66946007)(2906002)(8676002)(30864003)(66556008)(82960400001)(53546011)(966005)(38100700002)(4326008)(36756003)(6636002)(45080400002)(5660300002)(6666004)(83380400001)(2616005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0dzSWwxcklub2VFWllvaEs0Q285SlZWWnkrMS9HRzZYUXZ6Q0Y1dk1ZZk5z?=
 =?utf-8?B?QmVnVHdDS2V4QlFpMng3UGpZS0NsUEY5Yk1JR2tVYXBHSFc4a2Y3b2I4N3FD?=
 =?utf-8?B?TmI4NDhGTDlrZ29KbUxyUWxkUmQ3elZCZmgwV3RXSU5oZlV1TGo1eHViVHNw?=
 =?utf-8?B?ajRLM0ZzRXBhS1ZjVVpxcGVvaTFwYjFuNnpSUHl2dHJVeXlYRHdrYXB5eXBS?=
 =?utf-8?B?ZFh5eWFrcDgwZVlYamJFdDR0bjNkaGVFTnZySk5RTE5aMzBtVUxkMHpZaGgv?=
 =?utf-8?B?VmhhQ281QzdaQnYwWjVBemZxZmpSalFnOVNOUzgyOEpXNDBrb2lZdlBIWGpD?=
 =?utf-8?B?VFljaERyYmhmYndrT05pY0hzZ2VWY1Y2NkI5SjhieEJJellLV2djdUl6VUFG?=
 =?utf-8?B?RGl2ZjVjNVd5QnJUZDNWdDFwdnZvUW9BWGV0cUF6dUdBOUF3cVdEN3FCZTJ2?=
 =?utf-8?B?TSs0TU5DWUN1Yng5aUR0N0IwcDZ4TDhvVStBUXQwd3R4aXd0N1g0Y0RWZ1Yx?=
 =?utf-8?B?QVMvbGhPSXM3Rjd3ejNjRjlhZmZ6VHhvZnYvUVdONjNCNVFMMWpHSmNIQ3hz?=
 =?utf-8?B?SjNMb0J5anJZanlyTGtHTnp2enRwMkQrZWhKa2VqWjZwOFhpQ0oyUUxYSFpr?=
 =?utf-8?B?VVpkbjlMMFlIRXhJS1FiYU5iMGJmWXppN2xNSFpoREpZYmFaaHVXYks3UVBP?=
 =?utf-8?B?TzY5SHFoTnRyanIvT3BYS213SjhCWkxZNmtML2pjZEJvRXJuTlRGOGd5UVVq?=
 =?utf-8?B?dUJPWGk4d3I2d2NuR3NJbXJacFltc2NJRTJPWENyd2ZCZEJONEVFMVcwZVcx?=
 =?utf-8?B?YkhkU3NmMWlMNDY2TWRlenFlbDlEWlZzaTBadmZnb3FXWnVvWFU3dG9ER2tp?=
 =?utf-8?B?R3VZSlE5Z04rU0lqdUNNVHYzdDl2bEh5TTJQTlRSZjhjOFY0WVJaT0hyT3BQ?=
 =?utf-8?B?NUNHb2l3OER0eG8vOGlWc2p1MFVETXdjbXJuRThpNGdhVHdTVm9BZ2tsa1B2?=
 =?utf-8?B?RWtqM2VBaUUveW1IeU41dTgxSlZsMUF0cFV0Mi9LMkxoSkRxeXFEbUFIOENz?=
 =?utf-8?B?ZExDdzN3aU1CWTNtc1dGdlozTFBrY081aWFsWXhOQ2U0dXVadWRWbTlRWHFH?=
 =?utf-8?B?OUw1dWtPWHBFVFVGQWhSYWJDVHV6UjdxZUY0dFRiQWdnbkNlbTMzY3I2OHhX?=
 =?utf-8?B?MmQxMStJRmZtaVVucE9CVGJWYjFkSHdSUS9RaWdDb0srTkpsZU1wdkUzMnlF?=
 =?utf-8?B?UVQ5Y1EvWlN3UUtMaHhFOXl3SG8xbVh0MDBkNVBCak1zaWdjR2RDckN0K2c1?=
 =?utf-8?B?bzNhb0tiK2JiV1JHM2traVIrcHlHNkphdUNTaG5hSGxKNTFTSVVZV2pKT2o1?=
 =?utf-8?B?YWQxeU9WdDlCQmVuLzZLWjBZbVdoZ3I3Nmc1OXJ4MU9VbTFDSG9FWVNoekRn?=
 =?utf-8?B?QkRBSllqSW9sRjNpd1ViY0ptRmdiWWFOWDMzN0F2ZE5KblRiK0Z1VGovQnNk?=
 =?utf-8?B?U0c5RC9KalhLRmx4WUJ6cktpcXloU0w4WnBUMmZhZUJodUJobFZoRU9pSTNK?=
 =?utf-8?B?ZVdLRkJVY3drTkxKVkpTVzErZjJrN3VYNnVPSGRFdDUySVNTZ2J2UnpVZ3Ix?=
 =?utf-8?B?Y0pPYjJPS1AwRllma3MzVmdmcmY4YVNKN3JQSUlWdlhYMWxQWXU4VU9YbEtQ?=
 =?utf-8?B?SU1ybnBtVlY5YVlHdGZTQnV2bzNPWWROemYvby9BRXRxakJSUmFrTVVCc2dW?=
 =?utf-8?B?Qm56RHd5YS9YQzhKaDhYVU1oQURlRWFObVdWNC9xTkxib0tDNExOY0R3V1Y4?=
 =?utf-8?B?d1kyL0hzZU9LZU5mYTZPeUhIV0hPNWZ3d3RCRXkwUlByUFA2VXRFbzNzTkVT?=
 =?utf-8?B?dEI0WU00R3Q1bDBhc2RZL2h2S1lpcFFJT3JaOW50TUliTjg1eUFsc0xmSjNI?=
 =?utf-8?B?UGtIcEpKVlJoQmpGdWtTdXA5dGtibnJuLzZCYWsrRkk5S0I5cTUrcWw0SUx3?=
 =?utf-8?B?QUEyejc0dHRkYVdTdmxGZHpudEo0UmxqRDhtc3NFOC8wZWhqb3d5cDZoTzZj?=
 =?utf-8?B?OE9oL2JwSmRxOTR0VzhPckVKbEN6M0o3MHVJTW1JdExQYjZwbTQ4bkRFdk9J?=
 =?utf-8?B?bE5xTVBxM21nMmh2NXJoYnp5QWZBd1RuKy8zQ0YrL0VUY2xhRTdERi9wNDZS?=
 =?utf-8?B?S2VTa0JPSWdRZExhSS9vd3pQV0lqdE43eS9vK0ZlMktFd24rMHZ5RWUzalBS?=
 =?utf-8?B?WUoraHhra0c3UzQwZXZPMlhxdFZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c0ed48-4c16-4a8d-8ee8-08d9add8a373
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 16:53:41.8119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jm/j2ZhfXe0IMtzLAOgqKGGLmMSXl/Y8WOkZ5ger4KvTqCQg5dWDukuDS1NA+JSJzDPLnaCklyQKeGsASrUzwoAf65A0n6CzpNu6IXXH5XU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3546
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
Cc: intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The fix for this is in flight:

https://patchwork.freedesktop.org/series/96658/

It just needs a last round of testing before we merge it.

Thanks,
Daniele

On 11/22/2021 8:47 AM, Jason A. Donenfeld wrote:
> Hey Intel PXPers,
>
> I hit this splat on 5.16-rc1 during system suspend:
>
> Nov 22 13:54:09 thinkpad systemd-logind[934]: Lid closed.
> Nov 22 13:54:09 thinkpad systemd[1]: Reached target Sleep.
> Nov 22 13:54:09 thinkpad systemd[1]: Starting System Suspend...
> Nov 22 13:54:09 thinkpad systemd-sleep[519259]: Entering sleep state
> 'suspend'...
> Nov 22 13:54:09 thinkpad kernel: PM: suspend entry (s2idle)
> Nov 22 15:22:05 thinkpad kernel: Filesystems sync: 0.124 seconds
> Nov 22 15:22:05 thinkpad kernel: Freezing user space processes ...
> (elapsed 0.001 seconds) done.
> Nov 22 15:22:05 thinkpad kernel: OOM killer disabled.
> Nov 22 15:22:05 thinkpad kernel: Freezing remaining freezable tasks
> ... (elapsed 0.001 seconds) done.
> Nov 22 15:22:05 thinkpad kernel: printk: Suspending console(s) (use
> no_console_suspend to debug)
> Nov 22 15:22:05 thinkpad kernel: ------------[ cut here ]------------
> Nov 22 15:22:05 thinkpad kernel: RPM wakelock ref not held during HW access
> Nov 22 15:22:05 thinkpad kernel: WARNING: CPU: 10 PID: 519259 at
> drivers/gpu/drm/i915/intel_runtime_pm.h:112
> fwtable_write32+0x1cb/0x200 [i915]
> Nov 22 15:22:05 thinkpad kernel: Modules linked in: cdc_mbim cdc_wdm
> cdc_ncm cdc_ether usbnet mii snd_seq_dummy snd_hrtimer snd_seq
> snd_seq_device rfcomm cmac algif_skcipher bnep uvcvideo
> videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 btusb
> videobuf2_common btintel blue>
> Nov 22 15:22:05 thinkpad kernel:  i2c_designware_platform
> i2c_designware_core mei_pxp mei_hdcp ac97_bus kvm_intel snd_hda_intel
> snd_intel_dspcfg intel_rapl_msr think_lmi snd_intel_sdw_acpi i915
> firmware_attributes_class wmi_bmof snd_hda_codec kvm i2c_algo_bit
> snd_hwdep int>
> Nov 22 15:22:05 thinkpad kernel: CPU: 10 PID: 519259 Comm:
> systemd-sleep Tainted: G S   U            5.16.0-rc1+ #192
> Nov 22 15:22:05 thinkpad kernel: Hardware name: LENOVO
> 20Y5CTO1WW/20Y5CTO1WW, BIOS N40ET28W (1.10 ) 09/09/2021
> Nov 22 15:22:05 thinkpad kernel: RIP: 0010:fwtable_write32+0x1cb/0x200 [i915]
> Nov 22 15:22:05 thinkpad kernel: Code: 21 cb df 0f 0b e9 85 fe ff ff
> 80 3d 36 68 1f 00 00 0f 85 82 fe ff ff 48 c7 c7 70 cf c4 a1 c6 05 22
> 68 1f 00 01 e8 1c 21 cb df <0f> 0b e9 68 fe ff ff 48 8b bb 40 01 00 00
> e8 a2 cf ce df b9 01 00
> Nov 22 15:22:05 thinkpad kernel: RSP: 0018:ffff88821d283c80 EFLAGS: 00010282
> Nov 22 15:22:05 thinkpad kernel: RAX: 000000000000002a RBX:
> ffff88813df707d0 RCX: 0000000000000027
> Nov 22 15:22:05 thinkpad kernel: RDX: ffff88901f69b448 RSI:
> 0000000000000001 RDI: ffff88901f69b440
> Nov 22 15:22:05 thinkpad kernel: RBP: 00000000000320f0 R08:
> 0000000000000d17 R09: ffff88821d283c20
> Nov 22 15:22:05 thinkpad kernel: R10: 3fffffffffffffff R11:
> fffffffffff93a78 R12: 0000000040000000
> Nov 22 15:22:05 thinkpad kernel: R13: 0000000000000000 R14:
> ffff888101311150 R15: ffffffff81491b20
> Nov 22 15:22:05 thinkpad kernel: FS:  00007efcfaa87800(0000)
> GS:ffff88901f680000(0000) knlGS:0000000000000000
> Nov 22 15:22:05 thinkpad kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Nov 22 15:22:05 thinkpad kernel: CR2: 00007efcfb41e6f0 CR3:
> 00000005ed937004 CR4: 0000000000770ee0
> Nov 22 15:22:05 thinkpad kernel: PKRU: 55555554
> Nov 22 15:22:05 thinkpad kernel: Call Trace:
> Nov 22 15:22:05 thinkpad kernel:  <TASK>
> Nov 22 15:22:05 thinkpad kernel:  intel_pxp_fini_hw+0x23/0x30 [i915]
> Nov 22 15:22:05 thinkpad kernel:  intel_pxp_suspend+0x2f/0x40 [i915]
> Nov 22 15:22:05 thinkpad kernel:  i915_gem_backup_suspend+0x6e/0x150 [i915]
> Nov 22 15:22:05 thinkpad kernel:  ? pci_target_state+0xc/0xc0
> Nov 22 15:22:05 thinkpad kernel:  pci_pm_prepare+0x28/0x60
> Nov 22 15:22:05 thinkpad kernel:  dpm_prepare+0xbd/0x370
> Nov 22 15:22:05 thinkpad kernel:  dpm_suspend_start+0x16/0x80
> Nov 22 15:22:05 thinkpad kernel:  suspend_devices_and_enter+0x104/0x6d0
> Nov 22 15:22:05 thinkpad kernel:  pm_suspend.cold+0x2f6/0x33d
> Nov 22 15:22:05 thinkpad kernel:  state_store+0x6b/0xe0
> Nov 22 15:22:05 thinkpad kernel:  kernfs_fop_write_iter+0x107/0x190
> Nov 22 15:22:05 thinkpad kernel:  new_sync_write+0x100/0x170
> Nov 22 15:22:05 thinkpad kernel:  vfs_write+0x1c5/0x260
> Nov 22 15:22:05 thinkpad kernel:  ksys_write+0x4a/0xc0
> Nov 22 15:22:05 thinkpad kernel:  do_syscall_64+0x35/0x80
> Nov 22 15:22:05 thinkpad kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
> Nov 22 15:22:05 thinkpad kernel: RIP: 0033:0x7efcfb27ccb3
> Nov 22 15:22:05 thinkpad kernel: Code: 8b 15 81 11 0f 00 f7 d8 64 89
> 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0
> 75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48
> 83 ec 28 48 89 54 24 18
> Nov 22 15:22:05 thinkpad kernel: RSP: 002b:00007fff279a5308 EFLAGS:
> 00000246 ORIG_RAX: 0000000000000001
> Nov 22 15:22:05 thinkpad kernel: RAX: ffffffffffffffda RBX:
> 0000000000000004 RCX: 00007efcfb27ccb3
> Nov 22 15:22:05 thinkpad kernel: RDX: 0000000000000004 RSI:
> 00007fff279a5400 RDI: 0000000000000004
> Nov 22 15:22:05 thinkpad kernel: RBP: 00005571997e72d0 R08:
> 0000000000000007 R09: 00005571997eb4a0
> Nov 22 15:22:05 thinkpad kernel: R10: 11500bc5676901a3 R11:
> 0000000000000246 R12: 0000000000000004
> Nov 22 15:22:05 thinkpad kernel: R13: 00007fff279a5400 R14:
> 0000000000000004 R15: 00007efcfb36aa00
> Nov 22 15:22:05 thinkpad kernel:  </TASK>
> Nov 22 15:22:05 thinkpad kernel: ---[ end trace efcf3c6627ff7163 ]---
> Nov 22 15:22:05 thinkpad kernel: ------------[ cut here ]------------
> Nov 22 15:22:05 thinkpad kernel: RPM raw-wakeref not held
> Nov 22 15:22:05 thinkpad kernel: WARNING: CPU: 0 PID: 518230 at
> drivers/gpu/drm/i915/intel_runtime_pm.h:104
> fwtable_write32+0x1a4/0x200 [i915]
> Nov 22 15:22:05 thinkpad kernel: Modules linked in: cdc_mbim cdc_wdm
> cdc_ncm cdc_ether usbnet mii snd_seq_dummy snd_hrtimer snd_seq
> snd_seq_device rfcomm cmac algif_skcipher bnep uvcvideo
> videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 btusb
> videobuf2_common btintel blue>
> Nov 22 15:22:05 thinkpad kernel:  i2c_designware_platform
> i2c_designware_core mei_pxp mei_hdcp ac97_bus kvm_intel snd_hda_intel
> snd_intel_dspcfg intel_rapl_msr think_lmi snd_intel_sdw_acpi i915
> firmware_attributes_class wmi_bmof snd_hda_codec kvm i2c_algo_bit
> snd_hwdep int>
> Nov 22 15:22:05 thinkpad kernel: CPU: 0 PID: 518230 Comm:
> kworker/u32:4 Tainted: G S   U  W         5.16.0-rc1+ #192
> Nov 22 15:22:05 thinkpad kernel: Hardware name: LENOVO
> 20Y5CTO1WW/20Y5CTO1WW, BIOS N40ET28W (1.10 ) 09/09/2021
> Nov 22 15:22:05 thinkpad kernel: Workqueue: events_unbound async_run_entry_fn
> Nov 22 15:22:05 thinkpad kernel: RIP: 0010:fwtable_write32+0x1a4/0x200 [i915]
> Nov 22 15:22:05 thinkpad kernel: Code: 00 00 c6 00 00 e9 02 ff ff ff
> 80 3d 5e 68 1f 00 00 0f 85 9f fe ff ff 48 c7 c7 a0 51 c7 a1 c6 05 4a
> 68 1f 00 01 e8 43 21 cb df <0f> 0b e9 85 fe ff ff 80 3d 36 68 1f 00 00
> 0f 85 82 fe ff ff 48 c7
> Nov 22 15:22:05 thinkpad kernel: RSP: 0018:ffff8882e341bc60 EFLAGS: 00010286
> Nov 22 15:22:05 thinkpad kernel: RAX: 0000000000000018 RBX:
> ffff88813df707d0 RCX: 0000000000000027
> Nov 22 15:22:05 thinkpad kernel: RDX: ffff88901f41b448 RSI:
> 0000000000000001 RDI: ffff88901f41b440
> Nov 22 15:22:05 thinkpad kernel: RBP: 00000000000320f0 R08:
> 0000000000000da7 R09: ffff8882e341bc00
> Nov 22 15:22:05 thinkpad kernel: R10: 3fffffffffffffff R11:
> fffffffffff94e08 R12: 0000000040000000
> Nov 22 15:22:05 thinkpad kernel: R13: 0000000000000000 R14:
> ffff888102394150 R15: ffff888100068005
> Nov 22 15:22:05 thinkpad kernel: FS:  0000000000000000(0000)
> GS:ffff88901f400000(0000) knlGS:0000000000000000
> Nov 22 15:22:05 thinkpad kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Nov 22 15:22:05 thinkpad kernel: CR2: 00007f3018027098 CR3:
> 000000000200a001 CR4: 0000000000770ef0
> Nov 22 15:22:05 thinkpad kernel: PKRU: 55555554
> Nov 22 15:22:05 thinkpad kernel: Call Trace:
> Nov 22 15:22:05 thinkpad kernel:  <TASK>
> Nov 22 15:22:05 thinkpad kernel:  intel_pxp_fini_hw+0x23/0x30 [i915]
> Nov 22 15:22:05 thinkpad kernel:  i915_pxp_tee_component_unbind+0x19/0x40 [i915]
> Nov 22 15:22:05 thinkpad kernel:  component_unbind+0x26/0x40
> Nov 22 15:22:05 thinkpad kernel:  component_unbind_all+0x85/0x90
> Nov 22 15:22:05 thinkpad kernel:  component_master_del+0x73/0x90
> Nov 22 15:22:05 thinkpad kernel:  mei_pxp_remove+0x23/0x50 [mei_pxp]
> Nov 22 15:22:05 thinkpad kernel:  mei_cl_device_remove+0x1a/0x80 [mei]
> Nov 22 15:22:05 thinkpad kernel:  __device_release_driver+0x172/0x230
> Nov 22 15:22:05 thinkpad kernel:  device_release_driver+0x1f/0x30
> Nov 22 15:22:05 thinkpad kernel:  mei_cl_bus_remove_devices+0x56/0x70 [mei]
> Nov 22 15:22:05 thinkpad kernel:  mei_stop+0x32/0xc0 [mei]
> Nov 22 15:22:05 thinkpad kernel:  mei_me_pci_suspend+0x1f/0x50 [mei_me]
> Nov 22 15:22:05 thinkpad kernel:  ? pci_pm_suspend_noirq+0x270/0x270
> Nov 22 15:22:05 thinkpad kernel:  pci_pm_suspend+0x6c/0x200
> Nov 22 15:22:05 thinkpad kernel:  ? pci_pm_suspend_noirq+0x270/0x270
> Nov 22 15:22:05 thinkpad kernel:  dpm_run_callback+0x36/0x100
> Nov 22 15:22:05 thinkpad kernel:  __device_suspend+0x122/0x4c0
> Nov 22 15:22:05 thinkpad kernel:  async_suspend+0x16/0x90
> Nov 22 15:22:05 thinkpad kernel:  async_run_entry_fn+0x15/0x90
> Nov 22 15:22:05 thinkpad kernel:  process_one_work+0x1ce/0x370
> Nov 22 15:22:05 thinkpad kernel:  worker_thread+0x48/0x3c0
> Nov 22 15:22:05 thinkpad kernel:  ? rescuer_thread+0x350/0x350
> Nov 22 15:22:05 thinkpad kernel:  kthread+0x13c/0x160
> Nov 22 15:22:05 thinkpad kernel:  ? set_kthread_struct+0x40/0x40
> Nov 22 15:22:05 thinkpad kernel:  ret_from_fork+0x1f/0x30
> Nov 22 15:22:05 thinkpad kernel:  </TASK>
> Nov 22 15:22:05 thinkpad kernel: ---[ end trace efcf3c6627ff7164 ]---
>
> As this is new code in 5.16, I thought I should report it to you. I
> haven't started debugging it yet, and I'll load up rc2 this evening as
> well.
>
> Jason

