Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7517FE2D0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7796F10E68C;
	Wed, 29 Nov 2023 22:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C536610E507;
 Wed, 29 Nov 2023 22:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701296073; x=1732832073;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=PNTCXipTZKu7TlhAPFJ72vBS4tMF6WeHCPQIRaENK34=;
 b=BLflA+qeA2DB7Os0RmeDH1/HZ5xj6aOZb9v3MuOmHE4sx+CiR1InO+SK
 egnUf6npofNpaHKTFuYBJ74p5DX82OkBDtzo5ha5fIneTPgsoyU3t7v6T
 2GmYPOpIhHozyo1GzkXkdTPQC75dS3Z5ryPyZ21apcngc8RdTDdjCCpQh
 nw0beBKYE4KuZh1SBQNxpMb1xQVzOw9pIzd/xK3POyqYF44n+5wPjqXVw
 pRbmVBUObHV1Bwq6tfiVlVwx6y/G53SK5hFFyiG2nPErRBUB1w0jr14LE
 Q7Q+N5sPaOCaBkYxlN/piRi1RoQqAoYJktDUZkyJH5zQk2yjp41Dls6wV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11935200"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="11935200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:14:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912984067"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="912984067"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:14:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:14:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:14:31 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:14:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgFEt0I+nR93Ju4Su0A8Hf+oa7rFT5S7XZT11DpVx12AkHbX/+U19jLhfrq1WDU7ZurZMThQ+JfIE5MEFnUYQBFB/f5BpvQVq/EuMEDG2xGnZrUm5etORxLihe1UuC/sY7B5JO8n0q+M9maJ1MYzTZABorrd7FNn8Q17qRfwO+zM+UrYL22bspS21djhKX8ITDSM+ejxAD4rEIgLfTCIwqiqklHU/wzu0XnLGz1g292LcfNlItRuSRieL9GeFyGxOKuYo28nSQdj+7ME2pAdvSbrB/Gk9BdT+2xtq6a95UhCZ2rUTKJKFJ07J8+dd/XHsjEOfM/zLx7F1Cl7PjNi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUxbC840QJZwzqjaVtD+y/vWh9daMYyj/GRc15uUAUA=;
 b=R9KQwd6RTClAIcB88+oW3vTBnlR9Ym2tXksr3sBkvVuX25mkiZy5zk2MPkwIrtpC/jNrwU8Qw8cB5LTcHQmYj+lJaUPRvGy/BgkbzvtMAf4TLO+rJAraTO+ItX9jCDtXAGKvtm7vSp1UmobTCtyd/G9QJV3IajtD9b3k5RGUT8v2K+BQDIbUmaaH1BsKWA5yDHvcxOtdhkiaOCupjl4JC+tZZZJ1zqq2gOAWHj2Np/bTRWNh5fNlHNYnXFfESZTu68MdgHK+Kh8tBYPHZbeGTYyqFT2ve4N0bByn3OcUMq24R0TXTuRma20R599qT8gKrM1IQOnH0vwPWY6uwwFoNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Wed, 29 Nov 2023 22:14:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:14:28 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] drm/managed: Add drmm_release_action
Date: Wed, 29 Nov 2023 23:14:10 +0100
Message-ID: <20231129221412.1180549-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: e11285ba-29cc-4439-58ba-08dbf1288dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4/CrxrzGzdP2HPS6gWZbmbdRQ6jzG+ZklUY1d+zrL/ZtlHEfzM6okGqP5N9z2GYxqNH0YRsSQOlc40o/5czseONQITAhyTQO2WQYeOYEr5d2E/1pQal/tHdDoYMdNgIfpqO2ycaz0yiSyD7Yo0JgMzsOWWbVNHxjNOIM4uiH2pyRIZannbO3fndcfOxneFm5IlhkvffiodCg/328VFCWAywpzTyzDfEQuVg8s2FEAtmtdEnoI4XJWelpnrKokNhr1P6WOa5ILN1+Ofz0MPaX2cOKy4v0aHtX9JUzt+/VLs3yYZqMOpYuzDPWxwW/v0A8E3wg1LC5oVpbMSjICX2g51bMgGO0AufYRDWAQWT/Pzd83eQpyX1yIoo05vR6lFyKykFL9Z0Xnz4U8PcVbcYg9KBG/mb9hx8wSaJq9uNPDzZmSF0lWz8LeHwz+Sik7mfluT2gWNdISZpt2+2GDw73VgKXxXAFCiCIYc0djtITA72Fv/0XDo/+pX1ZXGUa+N4xAyKQ98PapE8v0wnWPaZrVUCopsSV2mY7R5wRBlfAjAU7vm6nY6wkC7FCIAz1WF094R1Ek3gTM4C08wG9aE8yJnnRBX1EZH56p034VDzfJ/owocHARpFZwOcKQkdrPHQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(4744005)(7416002)(5660300002)(4326008)(38100700002)(86362001)(82960400001)(36756003)(8676002)(8936002)(202311291699003)(41300700001)(66476007)(54906003)(2616005)(478600001)(66946007)(316002)(66556008)(1076003)(26005)(83380400001)(6666004)(6512007)(6486002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFyZ2VwTzFWU0lOT0RtREx1MTgya0VvVVFKRE0zZWUvaTJPUGNIajlvVGtI?=
 =?utf-8?B?dXJPdWg4QStyQytRQmNRb29RUUtLc0YvcEU4aEFxYTlHZTZmRXlxTnljMy9h?=
 =?utf-8?B?RzhvMVdzWGk5aTI2cy9LdjBFNnZEZXVaMHUxUWwrak5GM1NLay9JaWRXeGpU?=
 =?utf-8?B?VE9BdjVTV3h0MEVwcTkzRHhpWm5GcDZWTzNKNGlJMENzdC9FWFRTbmFJOEww?=
 =?utf-8?B?SnJWZnhpbXZoTlI2c3dtLzMrSk9nNnhhMUhhM0FkSHVYcHhwZUJONENtTHAr?=
 =?utf-8?B?UVJLTENZT2pyWjhmSFRWYUp2WFBhVXU3YVVEUDd2UWtPOHJxRFMxTHRvdndv?=
 =?utf-8?B?QlM1ZUg3RHA3aTY0NEJ4bDFLbTNodVFac0ZGWWNjcGljNWNDZ0JCMVNHdk9R?=
 =?utf-8?B?czBIcHZYeFBYam4yYURlNWJ6MDR1MXhFWUs1RHNsdVFoTTJtKzVXRkRuRWoy?=
 =?utf-8?B?b3dnRWtnSEtwV3VNKzFKcEoxVTVhbmZyQll4RDdkR205MWkrdzhScUl4YXds?=
 =?utf-8?B?UFdpVTc2dXN4dVhib3hValljeDZaUytFQi8rZllJNzZMcXo1TU9TZEJwZEZw?=
 =?utf-8?B?ZDNEMmVFcmlCN0ZuVXhxRjBtRWRPS1YyeUYvUy9aS2JQZS9EdGlJbXVyVFE1?=
 =?utf-8?B?Wmcvdm5icEJsM2dUOEZ5RlJaZzBBUHo3VGIvZWRxekNXOWxMQ3hGVlVWWnQv?=
 =?utf-8?B?MElKSklPWjZucUhmMDc0eWtFZmk0UVZJWWJJS1drMVZqcnVQOFNqT2tmcWVT?=
 =?utf-8?B?bk1GMGRhVm5iQ3FYYVNtbk9SakZpOVBYdVBiQ3Z6ODk1OUZoMVFQZ3RydGdY?=
 =?utf-8?B?ZTBDdCtIN2cyVVVVek9SOGdzMjEyQzgwV3lGWEQvcHlDaU52VDUrMm43QUdR?=
 =?utf-8?B?c3NIS1VwWnRjNVR4bTk3VFJ5VUc4eWlvRWcrODJGOGZDbDd1QmQrQXV3WDQ5?=
 =?utf-8?B?bDN2OVpLbnVVbExlSjN2YWNlY1B0enNJZWxiRjRrdnBnMjVMbTNXbzIzNU04?=
 =?utf-8?B?SkNLTkhERDZJNFRQVmlPK1Q3aWtPUEtIUWJwd0dQYnJQQkVmaHduTnphNHoz?=
 =?utf-8?B?U25sMEQwMDBJWDJGVHdZU0xiL0REMWREczVFWVdzcWw2NmdqSXpHNjJwbEFL?=
 =?utf-8?B?MjhWRnd6dFpXL0N0eDlxcnNISVNwMHY2Kzh2YWhPQjJocE5GVDFVMFVVZWll?=
 =?utf-8?B?VWhhelpidktYOThNVDhaOEVjUzZQUDY4YmEvZVcwaVIvZXh2bkl3SzNPb1Nk?=
 =?utf-8?B?anpYWHk5am02TlBIbjdFcm16Rm9CRXkyOGVXUDczQy9TTDNScTU2RytvSHVK?=
 =?utf-8?B?OXgyWFRZeGVZT2tiOFZ2aFZZeGRnK04wK1I0REVXRldpVkpUdkFkY0g4SENj?=
 =?utf-8?B?QmYxdnNSVFhISHhVcnkxWEFsU1gzdmxpWFgycFFWQytSOWhwWE9NM3ZoeTlT?=
 =?utf-8?B?cmU3aVoyaU9YUm52eCt2RjJSWGR2SGFoZXoxMWpKSHVHWjRQaGd2aFFkUHls?=
 =?utf-8?B?aXFvNWkwQ0ptU0hwMXc1ZVNvNGhOYldpVnFkZnBvWjM4VVh1QWZTaHlQVnlU?=
 =?utf-8?B?WlZlcUlEdXp6VHB2TllQeDFSWU82LzR2RUgvNUJIMTBUUVJPbWJXWktNOUpO?=
 =?utf-8?B?enlsZHo5M0s2VVpkWFptcjR6b0d1RVRHV3JFMWtaODE5OU9qZ3JXU0VONWYw?=
 =?utf-8?B?eFJzdlBGa0QxZVU4WFBxTXZ4NmFkdVlmZ0lkM0tjYW90M29kcGlOK2hYbnlT?=
 =?utf-8?B?NzQ1OFB0eEJkeEtGNzM0eXJoTWw1OWxRMzlKRXRxZnJBcjgyMGsrMUR5MmlU?=
 =?utf-8?B?SjU4YTBuRkpoZU1MVytLa2RWc290ekJFZGtsYXBic2xXb2NJcmk4em14ZkxG?=
 =?utf-8?B?R08yYkVPbDBabnJaYi9aQUhILy91dFJFR09KWVF6Tnk2WUkxRzJYcDFnbzVU?=
 =?utf-8?B?MURNODdtQ0tqbkxMZlExdnNYYzhja0xaTm1oYnJ6U1NsVzArTFAwblZkWitW?=
 =?utf-8?B?ZzVyMWVvOUF0cnYxMys4T0p0akRmdTNXdkhDKyt1T3RKZFl0UVptUDdJc0NW?=
 =?utf-8?B?anhoWVRKU2pGZjFSSTNNakxtcUp3dmVNMlE3VHBNZzlheGh6b2M1TGE4ZCt2?=
 =?utf-8?B?UW9LVzUrT2pKc1JCZWNJdFllOER3YTZxeitCRUIvVGhPQ1BUVklJUUc4OW5j?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e11285ba-29cc-4439-58ba-08dbf1288dc9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:14:28.4169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNJBm0A2y4ljJGZxfUk5UUHW1B2hYkztSOszFPsCGPg3iqjJNcqe3bjDN/nNOjDuRopz2wZj3NRhYAvWRDKbQ2qB7XxFXtEbgObD/CP5HRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcoming Intel Xe driver will need to have a more fine-grained control
over DRM managed actions - namely, the ability to release a given
action, triggering it manually at a different point in time than the
final drm_dev_put().
This series adds a drmm_release_action function (which is similar to
devres devm_release_action) and a simple test that uses it.

Michał Winiarski (2):
  drm/managed: Add drmm_release_action
  drm/tests: managed: Add a simple test for drmm_managed_release

 drivers/gpu/drm/drm_managed.c            | 39 ++++++++++++++
 drivers/gpu/drm/tests/drm_managed_test.c | 65 ++++++++++++++++++------
 include/drm/drm_managed.h                |  4 ++
 3 files changed, 93 insertions(+), 15 deletions(-)

-- 
2.43.0

