Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1753C6E6733
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30DB10E7CF;
	Tue, 18 Apr 2023 14:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBBF10E7D6;
 Tue, 18 Apr 2023 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681828299; x=1713364299;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=SQtiYqWXByue5ECu/PXjwNxKWY4NAKZ2qAnbZD/vpMk=;
 b=kpK3EoG0M5A0lyKQ7+Pn6iR+RP9ojk4cR5nrLX5NwI3subM6E9KTMXAN
 nrMhhF8vOOCeYAvk4lNFznnMvNUD+Qxce8At9vChcGxNyCW5L11S4GQ3y
 gFOEse1vFQbKAGrpSSZnEA8Dz7Q/5O3MpebtQ/yp94JLxaukFNgQDAivw
 HNVmkrkkj8wyQusb7xKBdV89CkX8S+gA7r8Q6W2yzEP5kcQxBHUYeNShs
 HFlNqSySDkb6zqKhL9qst37oEN40oLdrLcjcZWPTe2nPIdzuyiWJXR1q1
 U1cL4Lnk4/XQlrNJEQOOkuxkBixFd955aLMxDhYcyMkhMAKOEOPf/73td Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431472929"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="431472929"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 07:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="865413175"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="865413175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 18 Apr 2023 07:31:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 07:31:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 07:31:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 07:31:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 07:31:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSNXSCME0+66oOABUZ+L/tgdjxTe7l6NkIh8fye5Z+7Nkdf9O2u5rVihYcCrSIDXE2sBasWWuhasM6+KQ4btCT7qDkluWbsxM+xIpeml21kJY8CYzS4fMsRxDZ3+aT0J1k0g/zyDjJne7e72VokQin8P7wOmoeu5cG865bg6pEZ7eA2HUU11yp3jDRevJXT5OOTZp3U2lxyje97viK2qmzQPK341HL2w2MzM9XAfKIlHIXrf44q6ahun3xNtQ9s4KjD2xUkG5przYbcHpRvu2sIJBAagELcrZKvP5K33rw+w3LcjezqUSEnfKnJv7BIqYAqkS4s1SR6/YE8bOEHd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmZQB2lkZ5OuiHoKKRLJPtNf99Z+hPYFebYNJcjIs1A=;
 b=Q8+2dLqdeq70wjYSqyFEUQPxvZOnkF4iHL0di9cLpGLK7ChSMnvUlyDXTOKCK+xhHm45O41xtntgEnpk8qZZ7VwuDEaGhOZh6xGjrPwMiVHHFynqolv348bDxduk9FOJoCCh66MhwJGmdwlneeDYNdYtdtfvaFvg7wc1eDF8FrYfjPO2JH2QvfohdHsq1HW5HZKQFs+rDSD2lUpiAcA38ihsE5f0fTGxUvc9NlwmIzXMsCmxnftbrKSotcI96lgd42edMKsGrlFjL9TithakMKhEY5ENSJsnf0P6AdMU1nFfY5Xb7qsJF+807V/pOvcKjvqefTO079HF4byV4Xf1+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DM4PR11MB5565.namprd11.prod.outlook.com (2603:10b6:5:39e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:31:34 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::28c6:f268:89bd:e45a]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::28c6:f268:89bd:e45a%7]) with mapi id 15.20.6319.020; Tue, 18 Apr 2023
 14:31:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230418133133.80434-1-rodrigo.vivi@intel.com>
References: <CAKMK7uGSByfvxHnY3omh7S_XV2RShnG9nBan4374Kv90bVN5sQ@mail.gmail.com>
 <20230418133133.80434-1-rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/doc/rfc: Introduce the merge plan for the Xe driver.
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>, 
 <intel-xe@lists.freedesktop.org>
Date: Tue, 18 Apr 2023 11:31:30 -0300
Message-ID: <168182829003.58211.15709571878495267363@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DM4PR11MB5565:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9c143f-9a1d-45ba-17e7-08db40199c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HTSSAKEELfvAg78epeDjOAEsiPenDuBigFG4+H+Ca3aStT94ajWXKyOAxgBzNDWLQC5ju/kn4QiB7ozN1xF2F0xLqp6c6p8pI2d1dphqUZEg8i83sJT1UrIknQNB1qvEbyME0tXQ7DCiwBT3i1VisM3CS4RlruktMsAq59Wi0J+WkP/iGj/zLBaJxd70LuWCZhTWx/o6/LWVBv84DuuMtDll5L02Dc/lToxz6LxYJ7LnIxIi7xkWxK5PODYWrkZ0MCiqmD4PtKTRhfyeBNvl01ABt5q5ubjf7v2YGmW9SwqdQXJRxw8WzbctkywFxIS2Cx/CFSD3xB+eIC97L40M6r2D1R45EADiN4pMfDIXuC8xYswirwBQI4BNJL67tP+i1O5TRV064qIUwRcxBxLaoWA+BbCtIhLOFflfEnXfuDhNJt7PyIf6LAq9CfK6od1l1dBACx9iPrbAKmIAuZ/af00g1aA6g6FBVW2ie833jJlgt1SVGmOCfY75lrwFmcBSslvDLgrsYWaubGOqiEJpTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(44832011)(30864003)(2906002)(5660300002)(66899021)(8936002)(8676002)(41300700001)(86362001)(38100700002)(33716001)(478600001)(26005)(6506007)(9686003)(6512007)(54906003)(186003)(6666004)(966005)(6486002)(4326008)(66574015)(66476007)(66556008)(66946007)(83380400001)(82960400001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZIVWhPdmRJQUpuNC9YcVV5WWRZMXJQWWJCMXlwYW5EL3JmaGxpTkVmTXFI?=
 =?utf-8?B?bEVLa095VWQvQUVoTVlvMG5STFA5cndHT3pnWGdMZllMTDlMVS9uWmU0SFVs?=
 =?utf-8?B?azh5WnlZdmdmdDhrM1ZiWHR2VG1FRENIUDFqZHZXTmZiQmV5VHRJQ3c1OERX?=
 =?utf-8?B?d2JJTmFmU0cxK3h5eXZoeUZSZFcvMEN0dVMyZG13UEtvNXIzcUMwdVViZzFa?=
 =?utf-8?B?WEJvOXdWUTRqNFRmUXR6T2ZTeFNuOTh1R2M3UUU3NnE1SmV1dStXaE5xUWNl?=
 =?utf-8?B?WHF3THIxK2Q0WkpoWXVwZEtOdXNVWDVjZmVDRTdIdVRDSndGdHhpRDF2aFVN?=
 =?utf-8?B?WVg2MSthdmJLL1RSb2J4U1JLZDRUUjJFZUFkRHZKVGFnd3k3V3ZJd2RDZEJZ?=
 =?utf-8?B?VmlGbG4yWTFFZmJnUS9tdkZNcy9NeHNLL3RKdExiSmcwYkF3RjhHdlpMS2Vv?=
 =?utf-8?B?WlVENzlzSjExclNEckJYUm9ISHVtc1ZaMktyaWdiS2JEU1IyeE5Ea2pyYi94?=
 =?utf-8?B?bEZhaURoYkF6WjBzY3hkVWJjS0dJYUhmWXlCWDdyNmE5ZUh4d2RxaVpCTGJv?=
 =?utf-8?B?TnVMWFVCemlCSitqOUhnQitheWJYZ2hmcmFZSWhCNzBZcXNhNUM5SGY2bHYv?=
 =?utf-8?B?V3pIOU1YNTYxak5nMTVycFAyV2RyQ3pxS0p1YTY5RWVxbTRaQU1vQWFCR0c0?=
 =?utf-8?B?ZmQ3RFhPR2RpY3Z6RERRSUpyR25LYXlLRHJQM0laeWxhS3paNUExWTkxNVIy?=
 =?utf-8?B?Q2Z1dThhMzdmTGE5NjY2d0F2TjE0aFJqVGxmV3dqTG4ydlUvR2pMbW9LSHI2?=
 =?utf-8?B?UUR0Qjg1Wk1zRjNiVzgrczNQZHNEZkVwMEhtMHluNHpmWDY1dEJuTDd2bjda?=
 =?utf-8?B?ZjNqT0c0bTFLZWd5dmljZ0RWZlkzTmNnOGIvejdUdFhmRXN4b01UOG5PY29J?=
 =?utf-8?B?MHNocVc1WUdFSC9JblZUYll1ZWc0YnJrckZrcEhIeXNTNnRUMmRTMHRVdVIx?=
 =?utf-8?B?ZE9ub0E5blFXc3BTMlBBV1NHdmtZRlVrak5qWjA3bGVWM3hNTGNMWVVFamw0?=
 =?utf-8?B?WFZNMlczN0VrcHgxWXY5WFMrMFJSN1UzNVhsZEJ2NlNqeGhFYU1kUmNoczl2?=
 =?utf-8?B?R2ZmakF4amFJUmlkNC81U0lxWDZaTDlYZnlMT3k0UStXbzVEZ0hGVHdFbWZa?=
 =?utf-8?B?QktucWFCU1FyREE2REdsN21pZTVIcXYvNFZXTXBDQVpmWWxkNjZ3M0l3OVVK?=
 =?utf-8?B?cFdiaXJudHFzaXVya1dvZE5taG9vZkYyRFY0VXpoOFZ2bWxiWGQ0RzhyeDdK?=
 =?utf-8?B?TGNFZStsbnVDUE5MUkptY0F3T1lydHdQSGZEanlaVjh3R01lbXZYK2puMld1?=
 =?utf-8?B?TURMTnliN1FSNEV2a3VjWGFhVEV2Q0kreUs4UlBjd3dLQXdDL2dWam1TbkZa?=
 =?utf-8?B?ZW9XRlBHR2JnNytmaG5kd1BreDdDWHk3SVNrVExkSEtqaDl4UXYxTHhtVEl6?=
 =?utf-8?B?dEtRTCtoanlRdkd2eHFLMFdvajRsS1RYdjlIdU9MUFBjQUlBYzhSQkdITjYx?=
 =?utf-8?B?bWozMm5xK2FhbkxWd3dUQ01BQU9WaW9xQVNPNENIK2xRcGs2YXFZV1UzYW5n?=
 =?utf-8?B?QkRpUmhqMitKaHRvUncvcDlwSjlUUVJGTHp6UnozUVlwYWdHb3ExdHBUUmUy?=
 =?utf-8?B?K09vMkxDWVVqdFRwL2lYU3NTZkxnK0xpUVFZbjR5VStvQU1ZbTZXdUZ2VUFW?=
 =?utf-8?B?blUzSW5MdXJidHlxTER4U29NR0VtT2g4MER0emlKdWJNTHdYR2FKT2k2WklH?=
 =?utf-8?B?RW5sUlkzci9nZWhzRCtnYWJzOW51cVZzOEpFVW5jYkpaVUFqUDN1R2dicTNp?=
 =?utf-8?B?NUttT2lyNGFaNzhTTW1OQ3N5Z3oyRSt4ZVdKM2VnVWJ5LzBNTElvUmEvSE5B?=
 =?utf-8?B?eVdQclJaZjhtZXEvYTZBcERJU2lWY3B0bmpyM1dNcXpST3RJU3JoOFJkSnUw?=
 =?utf-8?B?T0E1cEowcUVCK0oybS9EQlZ2WkxMMzBLZUY3L00rWjEzT2puSUhqMGZsTzBH?=
 =?utf-8?B?SnhtY0JacWduemJIdVJRUmNCMERNV2V3SXVIVk8vZ1JFL1ZqWC9YT2NMMy9S?=
 =?utf-8?B?UHYxY0o5aXp4U1BUMllhSitCRGdjWDFqUFFZTlNRWW4rcmJwdXM4djBlNlpQ?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9c143f-9a1d-45ba-17e7-08db40199c0a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:31:34.3878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jn7UzdaCaJI1cYM6dWzPo1Sv6vbgheiWSXAT2NUXfIXkD5B3VE7lDAtSNufcVo1Dx8a9KzcR7LraKawJb9bHYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5565
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave
 Airlie <airlied@redhat.com>, Luis Strano <luis.strano@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rodrigo Vivi (2023-04-18 10:31:33)
> Let=E2=80=99s establish a merge plan for Xe, by writing down clear pre-me=
rge goals, in
> order to avoid unnecessary delays.
>=20
> This initial document starts with a TODO list containing items with clear=
 and
> measurable key results. Xe=E2=80=99s initial pull request should only be =
sent to
> dri-devel after all the items are clearly resolved.
>=20
> Since many of them involve some level of a community consensus, in many c=
ases,
> the consensus will be reached in follow-up patches to this document with =
more
> details of the API or helpers that will be developed or modified.
>=20
> Besides of the items that are highlighted in this document, it is importa=
nt
> to highlight that Oded, has been volunteered to give the overall ack on X=
e
> driver as the way to confirm that it looks good for upstream.
>=20
> v2: Incorporated Daniel's feedback:
>     - Do not make long-running compute a blocker.
>     - Add a mention to drm-exec that that ties to vm_bind and long-runnin=
g
>       compute jobs. Then I also added GPUVA since I recently noticed that=
 this
>       ties also to the work Matt is doing on that front.
>     - Added the devcoredump section.
>     - Add the mention to Oded being volunteered for the overall ack.
>=20
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Luis Strano <luis.strano@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/rfc/index.rst |   4 +
>  Documentation/gpu/rfc/xe.rst    | 234 ++++++++++++++++++++++++++++++++
>  2 files changed, 238 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/xe.rst
>=20
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/inde=
x.rst
> index 476719771eef..e4f7b005138d 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -31,3 +31,7 @@ host such documentation:
>  .. toctree::
> =20
>      i915_vm_bind.rst
> +
> +.. toctree::
> +
> +   xe.rst
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> new file mode 100644
> index 000000000000..9227a5370653
> --- /dev/null
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -0,0 +1,234 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +Xe =E2=80=93 Merge Acceptance Plan
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +Xe is a new driver for Intel GPUs that supports both integrated and
> +discrete platforms starting with Tiger Lake (first Intel Xe Architecture=
).
> +
> +This document aims to establish a merge plan for the Xe, by writing down=
 clear
> +pre-merge goals, in order to avoid unnecessary delays.
> +
> +Xe =E2=80=93 Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The main motivation of Xe is to have a fresh base to work from that is
> +unencumbered by older platforms, whilst also taking the opportunity to
> +rearchitect our driver to increase sharing across the drm subsystem, bot=
h
> +leveraging and allowing us to contribute more towards other shared compo=
nents
> +like TTM and drm/scheduler.
> +
> +This is also an opportunity to start from the beginning with a clean uAP=
I that is
> +extensible by design and already aligned with the modern userspace needs=
. For
> +this reason, the memory model is solely based on GPU Virtual Address spa=
ce
> +bind/unbind (=E2=80=98VM_BIND=E2=80=99) of GEM buffer objects (BOs) and =
execution only supporting
> +explicit synchronization. With persistent mapping across the execution, =
the
> +userspace does not need to provide a list of all required mappings durin=
g each
> +submission.
> +
> +The new driver leverages a lot from i915. As for display, the intent is =
to share
> +the display code with the i915 driver so that there is maximum reuse the=
re.
> +
> +As for the power management area, the goal is to have a much-simplified =
support
> +for the system suspend states (S-states), PCI device suspend states (D-s=
tates),
> +GPU/Render suspend states (R-states) and frequency management. It should=
 leverage
> +as much as possible all the existent PCI-subsystem infrastructure (pm an=
d
> +runtime_pm) and underlying firmware components such PCODE and GuC for th=
e power
> +states and frequency decisions.
> +
> +Repository:
> +
> +https://gitlab.freedesktop.org/drm/xe/kernel (branch drm-xe-next)
> +
> +Xe =E2=80=93 Platforms
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Currently, Xe is already functional and has experimental support for mul=
tiple
> +platforms starting from Tiger Lake, with initial support in userspace im=
plemented
> +in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well as in=
 NEO
> +(for OpenCL and Level0).
> +
> +During a transition period, platforms will be supported by both Xe and i=
915.
> +However, the force_probe mechanism existent in both drivers will allow o=
nly one
> +official and by-default probe at a given time.
> +
> +For instance, in order to probe a DG2 which PCI ID is 0x5690 by Xe inste=
ad of
> +i915, the following set of parameters need to be used:
> +
> +```
> +i915.force_probe=3D!5690 xe.force_probe=3D5690
> +```
> +
> +In both drivers, the =E2=80=98.require_force_probe=E2=80=99 protection f=
orces the user to use the
> +force_probe parameter while the driver is under development. This protec=
tion is
> +only removed when the support for the platform and the uAPI are stable. =
Stability
> +which needs to be demonstrated by CI results.
> +
> +In order to avoid user space regressions, i915 will continue to support =
all the
> +current platforms that are already out of this protection. Xe support wi=
ll be
> +forever experimental and dependent on the usage of force_probe for these
> +platforms.

The term "these platforms" seems to be refering to the ones mentioned in th=
e
previous sentence. Wouldn't that technically mean that Tiger Lake (which is
already out of protection) is also included into "these"?

When we say at the beginning that "Xe is a new driver for Intel GPUs that
supports both integrated and discrete platforms starting with Tiger Lake", =
I was
under the impression that Tiger Lake would be the first "officially" (not
experimental) supported platform.

> +
> +When the time comes for Xe, the protection will be lifted on Xe and kept=
 in i915.
> +
> +Xe driver will be protected with both STAGING Kconfig and force_probe. C=
hanges in
> +the uAPI are expected while the driver is behind these protections. STAG=
ING will
> +be removed when the driver uAPI gets to a mature state where we can guar=
antee the
> +=E2=80=98no regression=E2=80=99 rule. Then force_probe will be lifted on=
ly for future platforms
> +that will be productized with Xe driver, but not with i915.
> +
> +Xe =E2=80=93 Pre-Merge Goals
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Drm_scheduler
> +-------------
> +Xe primarily uses Firmware based scheduling (GuC FW). However, it will u=
se
> +drm_scheduler as the scheduler =E2=80=98frontend=E2=80=99 for userspace =
submission in order to
> +resolve syncobj and dma-buf implicit sync dependencies. However, drm_sch=
eduler is
> +not yet prepared to handle the 1-to-1 relationship between drm_gpu_sched=
uler and
> +drm_sched_entity.
> +
> +Deeper changes to drm_scheduler should *not* be required to get Xe accep=
ted, but
> +some consensus needs to be reached between Xe and other community driver=
s that
> +could also benefit from this work, for coupling FW based/assisted submis=
sion such
> +as the ARM=E2=80=99s new Mali GPU driver, and others.
> +
> +As a key measurable result, the patch series introducing Xe itself shall=
 not
> +depend on any other patch touching drm_scheduler itself that was not yet=
 merged
> +through drm-misc. This, by itself, already includes the reach of an agre=
ement for
> +uniform 1 to 1 relationship implementation / usage across drivers.
> +
> +GPU VA
> +------
> +Two main goals of Xe are meeting together here:
> +
> +1) Have an uAPI that aligns with modern UMD needs.
> +
> +2) Early upstream engagement.
> +
> +RedHat engineers working on Nouveau proposed a new DRM feature to handle=
 keeping
> +track of GPU virtual address mappings. This is still not merged upstream=
, but
> +this aligns very well with our goals and with our VM_BIND. The engagemen=
t with
> +upstream and the port of Xe towards GPUVA is already ongoing.
> +
> +As a key measurable result, Xe needs to be aligned with the GPU VA and w=
orking in
> +our tree. Missing Nouveau patches should *not* block Xe and any needed G=
PUVA
> +related patch should be independent and present on dri-devel or acked by
> +maintainers to go along with the first Xe pull request towards drm-next.
> +
> +DRM_VM_BIND
> +-----------
> +Nouveau, and Xe are all implementing =E2=80=98VM_BIND=E2=80=99 and new =
=E2=80=98Exec=E2=80=99 uAPIs in order to
> +fulfill the needs of the modern uAPI. Xe merge should *not* be blocked o=
n the
> +development of a common new drm_infrastructure. However, the Xe team nee=
ds to
> +engage with the community to explore the options of a common API.
> +
> +As a key measurable result, the DRM_VM_BIND needs to be documented in th=
is file
> +below, or this entire block deleted if the consensus is for independent =
drivers
> +vm_bind ioctls.
> +
> +Although having a common DRM level IOCTL for VM_BIND is not a requiremen=
t to get
> +Xe merged, it is mandatory to enforce the overall locking scheme for all=
 major
> +structs and list (so vm and vma). So, a consensus is needed, and possibl=
y some
> +common helpers. If helpers are needed, they should be also documented in=
 this
> +document.
> +
> +ASYNC VM_BIND
> +-------------
> +Although having a common DRM level IOCTL for VM_BIND is not a requiremen=
t to get
> +Xe merged, it is mandatory to have a cross-driver consensus and understa=
nding how
> +to handle async VM_BIND and interactions with userspace memory fences. I=
deally
> +with helper support so people don't get it wrong in all possible ways.
> +
> +As a key measurable result, the benefits of ASYNC VM_BIND and a discussi=
on of
> +various flavors, error handling and a sample API should be documented he=
re or in
> +a separate document pointed to by this document.
> +
> +Userptr integration and vm_bind
> +-------------------------------
> +Different drivers implement different ways of dealing with execution of =
userptr.
> +With multiple drivers currently introducing support to VM_BIND, the goal=
 is to
> +aim for a DRM consensus on what=E2=80=99s the best way to have that supp=
ort. To some
> +extent this is already getting addressed itself with the GPUVA where lik=
ely the
> +userptr will be a GPUVA with a NULL GEM call VM bind directly on the use=
rptr.
> +However, there are more aspects around the rules for that and the usage =
of
> +mmu_notifiers, locking and other aspects.
> +
> +This task here has the goal of introducing a documentation of the basic =
rules.
> +
> +The documentation *needs* to first live in this document (API session be=
low) and
> +then moved to another more specific document or at Xe level or at DRM le=
vel.
> +
> +Documentation should include:
> +
> + * The userptr part of the VM_BIND api.
> +
> + * Locking, including the page-faulting case.
> +
> + * O(1) complexity under VM_BIND.
> +
> +Some parts of userptr like mmu_notifiers should become GPUVA or DRM help=
ers when
> +the second driver supporting VM_BIND+userptr appears. Details to be defi=
ned when
> +the time comes.
> +
> +Long running compute: minimal data structure/scaffolding
> +--------------------------------------------------------
> +The generic scheduler code needs to include the handling of endless comp=
ute
> +contexts, with the minimal scaffolding for preempt-ctx fences (probably =
on the
> +drm_sched_entity) and making sure drm_scheduler can cope with the lack o=
f job
> +completion fence.
> +
> +The goal is to achieve a consensus ahead of Xe initial pull-request, ide=
ally with
> +this minimal drm/scheduler work, if needed, merged to drm-misc in a way =
that any
> +drm driver, including Xe, could re-use and add their own individual need=
s on top
> +in a next stage. However, this should not block the initial merge.
> +
> +This is a non-blocker item since the driver without the support for the =
long
> +running compute enabled is not a showstopper.
> +
> +Display integration with i915
> +-----------------------------
> +In order to share the display code with the i915 driver so that there is=
 maximum
> +reuse, the i915/display/ code is built twice, once for i915.ko and then =
for
> +xe.ko. Currently, the i915/display code in Xe tree is polluted with many=
 'ifdefs'
> +depending on the build target. The goal is to refactor both Xe and i915/=
display
> +code simultaneously in order to get a clean result before they land upst=
ream, so
> +that display can already be part of the initial pull request towards drm=
-next.
> +
> +However, display code should not gate the acceptance of Xe in upstream. =
Xe
> +patches will be refactored in a way that display code can be removed, if=
 needed,
> +from the first pull request of Xe towards drm-next. The expectation is t=
hat when
> +both drivers are part of the drm-tip, the introduction of cleaner patche=
s will be
> +easier and speed up.
> +
> +Drm_exec
> +--------
> +Helper to make dma_resv locking for a big number of buffers is getting r=
emoved in
> +the drm_exec series proposed in https://patchwork.freedesktop.org/patch/=
524376/
> +If that happens, Xe needs to change and incorporate the changes in the d=
river.
> +The goal is to engage with the Community to understand if the best appro=
ach is to
> +move that to the drivers that are using it or if we should keep the help=
ers in
> +place waiting for Xe to get merged.
> +
> +This item ties into the GPUVA, VM_BIND, and even long-running compute su=
pport.
> +
> +As a key measurable result, we need to have a community consensus docume=
nted in
> +this document and the Xe driver prepared for the changes, if necessary.
> +
> +Dev_coredump
> +------------
> +
> +Xe needs to align with other drivers on the way that the error states ar=
e
> +dumped, avoiding a Xe only error_state solution. The goal is to use devc=
oredump
> +infrastructure to report error states, since it produces a standardized =
way
> +by exposing a virtual and temporary /sys/class/devcoredump device.
> +
> +As the key measurable result, Xe driver needs to provide GPU snapshots c=
aptured
> +at hang time through devcoredump, but without depending on any core modi=
fication
> +of devcoredump infrastructure itself.
> +
> +Later, when we are in-tree, the goal is to collaborate with devcoredump
> +infrastructure with overall possible improvements, like multiple file su=
pport
> +for better organization of the dumps, snapshot support, dmesg extra prin=
t,
> +and whatever may make sense and help the overall infrastructure.
> +
> +Xe =E2=80=93 uAPI high level overview
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +...Warning: To be done in follow up patches after/when/where the main co=
nsensus in various items are individually reached.
> --=20
> 2.39.2
>
