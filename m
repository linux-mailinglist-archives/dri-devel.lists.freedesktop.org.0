Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64AC59EDF9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 23:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14AD10F9B7;
	Tue, 23 Aug 2022 21:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F28510FA0B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 21:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661288790; x=1692824790;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Y0WzJhdREa5SEctS21H3/HwKdCjEN5ra+fwJ8XN4KCU=;
 b=DBl2k98lxLmCHBE2cX6vVLKZuoZokBF5C6ErzHBI0HlMaokZ5v+EHCye
 PFOOpPxumCHLasWjsTzLqr+clmL2ubGSBc0yEftESzegu2rCofRXSzhSH
 uXFoB4LhsG3dZjzrwdFSbAfZGU6O9O5yM77Y05hHK+4lA5eG5tXsJMArX
 DwgywKeSaNuFziOufBi3a/AmMtB4Uigsy4ltDq3QVsj1OoNHw5kS+CM15
 b8gZQ63oAEXb5OYaE77rXoPHo3ls68zw0b39MdhqaswlTvspGWjQB/2hd
 ArPhsgKrVlbIyQVlSan4ExQFFa6KomDiXZApf13qIB79fNppeRyog/7R2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="294583502"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="294583502"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 14:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="670202976"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2022 14:06:28 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 23 Aug 2022 14:06:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 23 Aug 2022 14:06:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 23 Aug 2022 14:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5q1xshunfYagjCww9suYdt7wmoD328iMDGH4/+uWZ3dJrrn0+IDREWMvnwJm7+14uQbgmqnwyEM+o2JO0xY5p1YnriBdaY0CHY9e7/GW3fqTdYakeQMZCiX6OE9zF2k2MfMwnw5KFfC4THLy2BYhMJIYGuZ553Uj/kf23HsVWOCfr/ZKMWIohwMX6UoPizyIGK/SUPDmSSd4NpKKEg5mxOEve9QGaE9R10UhDoViWZFKXGIooYAJYmT/WnRIgWF1hITVMANlNNId7JDm29MlfXqrYM36drTYuPgf8YU3TYgqHXxgOup1gaZ409lXf2JaVauH+qe1rpHrDYOROO5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=833IfABGxgZRsY01bq6yFDbub2/Y8xleRPc0H0S+N24=;
 b=iXnLj4g6oh8zBV/xZTunDpVWhddeYz6IfdvYvElW+nYmHJHrvslhmnc0BLjhpRm7QHaG/5/+8AZLaFSyd8WcZ9kka9m3hLtZjccxEr+5jH1Jtp7IzmnDN2g3yVT19D8mdqM3NCjT6+7S/wyUJHucQIsKgAH2nn5pE4qnzesleG0zRZjI0Wte98zsOlX3Xt4Pl/YCjQXEgX0oxBm6NrAE6XxLLFRwEzpsWdxsJhsQRsqmCvgIA+tjjVTQhP77zXK+TfNgvhltlokRs0GwTUKEmllu+OYGrCvPXFLIBTuCJjNzU+UD9vDknSyIPhrn9saathYFzpOHH3H+5N/CQMLbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 21:06:26 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 21:06:26 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] drm: Use full allocated minor range for DRM
Date: Tue, 23 Aug 2022 23:06:10 +0200
Message-ID: <20220823210612.296922-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27dde55f-e3f8-4283-b73d-08da854b573d
X-MS-TrafficTypeDiagnostic: SA2PR11MB5130:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /sx1k7T+crMK9PqQeniY5utsvCRedEoUAkXAF3JKADxkhY4TaJYBlo0PZPOJ/CRJeQAdNkBoPbOvjUk15YVIgovPw45vAg3p7EWuI6iNdyA7UUI+wN3kEFWkz5noIDgr7aQgGi1FI+9TulKBGtbDzOqaEuYhkGOe0Q8YWoCVlmOsMJZ6r3xuXGXZv2LFCPTTgiBOXHR7ENYJGFxpNXcN1kwmtNY6JrFUu4HSxms7TgVbxuImc+VVXhJ17QXPJkNzC6/OF9yY+f18Ian0FV3a8Xa0epUE7yPOvhyWgrcGv8tOE3Yk23aoXZsRv9gEP5gfZEREey06HnSUXCOkXX1Yf1tVheJ+RKBMxBxKYbh8As9vQU0pwS654gyFcT/9cAg2cMDJFvlcXXi136JqPzGrHU6nm6n7Li5HTajxvWmWaNlxFR/xUBy9lLuUQfOIi+/C2Brc87rY0NrDZfSaXH52YYc8QhZptrYR+cTA5KsmwtCg/6YQ2taF0WgSbePLN2ydo8EdZd1AA95fhiYEIaCxdxAFy7j3ykabCzAedZaqME3NuaTGk2YpAH2aqJPCa/PBEyEoIwl8d+xhsf6mRIi3PRWSf5swL04eWoqWpshVv8jndzsNy/L6cA2E/nkYLohUJfnDhOjROMMsxL3buBj68At81FHLQK1l7NRoMmckR0HRo3M2rquElXqAfc+FUlEK5UvxnH4RuRxi2jr1SirNmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(136003)(346002)(366004)(396003)(6512007)(6666004)(4744005)(5660300002)(186003)(1076003)(6506007)(2616005)(8936002)(36756003)(26005)(86362001)(41300700001)(83380400001)(478600001)(6486002)(38100700002)(82960400001)(6916009)(316002)(54906003)(2906002)(4326008)(66476007)(66556008)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzBNUWdCVlEySVJqZHd5MWFqU0lxYUo2aVBSalVuNzlEalY0aHJoUzlkTnZX?=
 =?utf-8?B?aHl5aTJpUm5jMTFERWYvemFhRlBvRWwyWmNyaStSUlFaN2NWb3U4d0ozU0VZ?=
 =?utf-8?B?OUZvaldva3dVaVRlSW0yNlhSeGpKOFNtZSs3WmZTMWIzLytYdlBLSnBZWms0?=
 =?utf-8?B?MTNXd3BZWjBYUlp1SE44RjBUMlFKbFZKejBkb2tybUI4bnVqM052V0g5RjJO?=
 =?utf-8?B?THNsbTRtNHY1ZllLc3pZZEZTdXQrMDFLNTJQd3ZoRExwdVZnek82RktlOHZl?=
 =?utf-8?B?RWhlcHhpUW1aaXR4bTFpVkF5bU45VGNRUGQyTnZhbDNtdlZlelBMbmNzeHZQ?=
 =?utf-8?B?UkxudVMxbURNYTRJNGxNR3F6dnhsVWZKM2E5WmlYWUErdGZQdmluOEpZWmNE?=
 =?utf-8?B?ZkFVeEZQZHQ4MUZKMVpNOWxqUHUzQnZHUHJJUVFCdHFBVllFbEhCYVhOeHp2?=
 =?utf-8?B?UEljKzZKK010Q2h0cmlVbCtWSEhBbEg5UEtwNVVzNHQ0S1ZBd1kwQXE2bXRw?=
 =?utf-8?B?L3E5QXY0YjJ2Qmh1TW44QmNMUmk1bjkwUTZuaWVYVWI5VEVjYjU0R2NBUFdX?=
 =?utf-8?B?czgxM0VMZFY2bTJ2dE5TaXFIVllySE1ZRDFiK0c2SXFyMjM1VzIyWmVUY1Ey?=
 =?utf-8?B?NGdpM0VWRjk4NE43b080SzIxZXd6NjloQkh1b3NNL012cm5mTXRKOWhyYXNW?=
 =?utf-8?B?OWlVWTZZVDBCcDlMay9YcWd5aU5rNFg2b0FzeEttcnpFTi9UQ0sxVE1LdGpa?=
 =?utf-8?B?UlFzdzhRT1JCdm52SFI1ZHRneHRYT0crZ3pzMGg3cTZTQ3JyaysyL0l6R1lG?=
 =?utf-8?B?b2ZsVmo3Z1FnSkN0TmcwOUYyaGVLNzlJUEs0NEprLzQ4TUhSQmk4NmloZUdy?=
 =?utf-8?B?R3R0M0JYeVc1TEl3T29RT05YQkxhVTc0emt0eHNUWU5PY1RZTy9UWnR4Rk9m?=
 =?utf-8?B?bGY4WTBzUytTRElZcTR4VzRzYkJGSzUxb2w0dVR2OVdVNUxkVGpzKzRzSURz?=
 =?utf-8?B?VkREbEJMeWtMdDFGNGpldzlpaUdRT3JjR3EyMUFwOHVnRnRpekwxSWNVMWF2?=
 =?utf-8?B?RWRjREE4RXB4ZjhZeGhXU1FsTDFDa21CVHpkTy9CM3ZhZHZsQmc1NEpZdUIy?=
 =?utf-8?B?Z0MwWWZSZm9NakROY2pnR1pHck1BcGhCRGxFRHRZNWVRTUlramRJck8xN24z?=
 =?utf-8?B?YmJleUFiZTZuc282clBJYVBxenNPQ01rS3JwTEZPVTc5amhjWXhGVng1RVB0?=
 =?utf-8?B?cHRKSk5meGdxbjYySjlLcExvTEpLd1ZUdTVZcG42R0g2K3c5emh3VExGSitG?=
 =?utf-8?B?NUpnaUR5QXRTWlhwU3BjN05RKzhKUEh4ZG5hSUlsM2taQ2E1SUpNTUdNU3hR?=
 =?utf-8?B?eVQ2d2dpWmJhekdmckhqdllWUlZ1eEtpT1Azd1E0U3JNcXh0dGVLZ29ndUEx?=
 =?utf-8?B?UE9jYlB3ak9CdEIrRVdrdGpjV0tSczZUZHRwZ0Y5Wkd5ZmxUNFNvbEJFMXhq?=
 =?utf-8?B?RVlKR3V4d2ptZUxQblhJemY0cW01c01JZTRCQUJCTWpqK2xUUldFTkc2WE1s?=
 =?utf-8?B?MzdmNjQ4UWVNc0VTYWVNM3pJTStFbE5DWHBMWEpxQjl1dHl6QkxMeVlSbmxq?=
 =?utf-8?B?UVQvZFlMTDV5emRJd0pENnpoTlcwRS8vVkJsV0hoVkZycDRBNjBrTmZEQjV1?=
 =?utf-8?B?dy9sZFYyc2ZEUHZIRkZmeFRsSnluU0xKQ0JpRlFORURIZ0JQemUzcGRrY2c5?=
 =?utf-8?B?MHZ2L3lkT21HZ0V5MWp3NWhOV3hSOVl6Y3JpWjRYb1JwR1AzMFU5TXFtT2NN?=
 =?utf-8?B?LytvNm5GK1VmSlJQZ0p2V0VyQm9GZk12N05ETEZ6TUFNUVk0RHVBRkZSK3pJ?=
 =?utf-8?B?eWo3blZFdWdNVzJFUlpvQWlRYUJOTEtPL1k5MkdRaGJwKzNIbkRma1JCMXNV?=
 =?utf-8?B?bnNtc3Eya3pUNkZZV2NPWUNSQW5waWo1RWxmN0NnOWVneHJFdHVGY1NkS2NM?=
 =?utf-8?B?a3dlMUtxODR4c1lRWWFMejBLaXF6UHBhanRubURQWWtrVGtXMW16UkttUGJx?=
 =?utf-8?B?dGc4dUFyeW8vVkR6b1lCM0pYeFZWMm5aSVc4MFkyeEZlU0VQV2huUzVmTERV?=
 =?utf-8?B?MGQwb0hZaGdxS0wzaUlRSE9JU1dDNnR4dHlHWGtLZzFRSWREYXdZR1A5VUdV?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dde55f-e3f8-4283-b73d-08da854b573d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 21:06:26.0300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTLYt4zkaSSZQhBIfk4rCEXL+oZWdqr1ShtkYX62gyiqMRhgYWaT5SOSZBw/zOMvj8Jgns63iIfWKzAwpWmVB2S412WFRkxQ95nF5k1teGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

64 DRM device nodes is not enough for everyone.
Upgrade it to ~341K (which definitely is more than enough).
Additionally - one minor tweak around minor IDR locking.

v1 -> v2:
Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)

Michał Winiarski (2):
  drm: Expand max DRM device number to full MINORBITS
  drm: Use mutex for minors

 drivers/gpu/drm/drm_drv.c | 45 ++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

-- 
2.37.2

