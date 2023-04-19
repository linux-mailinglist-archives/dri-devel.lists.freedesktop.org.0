Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E066E846B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FDD10EB2B;
	Wed, 19 Apr 2023 22:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54EB10EB2B;
 Wed, 19 Apr 2023 22:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681942459; x=1713478459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VtJqOJ0CkkWmTKYVpWed0OQTLtLkf1POIU7cTgoAyCA=;
 b=IyeWqKBbdiI7uZsJX8zx5r7GJF44VBg69diEmTYpwUdw7WXHUf1RNy/O
 wUWEab4RwzF/Fstkg8XfoAcx4vDb0VUDZjxC8Crff6AMp8o4iZKsQkHu+
 7bg43z7yfA/hCoqf62v0462kvS1nCFJ3diqUVueqJJ0NI0Aad67HrjGGu
 AZxtoOYeSUmdSUB0J+JqHrhMT5A/CKPenCd6FK6ngz/WqXTf/AnqbiC0h
 2Gxg1XLE4zZZukdYaXtXXNnccgbORSVQPWIqFhABTmiBvJx0cGnSwB3rP
 y9nNTmOU/iP3t2hWvHvtfHYeAexa0fqWsWuI7GWuSlP72x+T5OC8njQN9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347429788"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="347429788"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685114849"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="685114849"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2023 15:10:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 15:10:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 15:10:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 15:10:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B77C2OQV7/KnB4hXz5fCIjRfi2vAI0B7QoUPF2DRu1PX+A6oB7ckGs+nrOkWi8sW4yvcOJE5eEe71hj7eMPiiCwEcIMcMUGjSixUtjb7Nw4EtZfyZryNZJ/bf36Bz0A1gaqzHOU0K1hcmCuDNHhOSmeK6nduWnVRMD4jabUvxzt9bc8nZLZhFscoWYKEGPtWFrrpX2vP/hEq0vQ22vctxXJoLgFbCYk0Fm1HqjcqCzVvk3ozn5su9zWnVvW9WFI8Coa27Eo5jfcpTWqsGAgFNa33V7MbpnPS1scThLqnqZcyPINiDvgoMK7isZokk4y5AipsH6670jktOlOx+tX0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhWjpPnf+GCkiiBlz7TB0oHtvaOx/1+f7IrdxwLEf/0=;
 b=kAPGhJeUmOKRmaAEDe0BV1toTMlkGa9YwPYdFFrT+nULK99NmIdyF8mggmIxadPgeH7rRT0j3LDCBmoBEw/ZHfpcCR7J9YUU1cUhpRzLpTPOxjTQZqVYR6XpDqYyYX6cwcudK958GvsLJo1nEWnpjoCRNA+MKBxfQPUY7SDj2TMsdnkBPov+1vI0BmP+I8GhCM/PTLfC2B1SYUSF3G/Le0/ZV7iJBAx1QcKLK84CDGtJfSptjKXW+1QQmhtRP+fE4Rdf2ib0SqA+cePYLO24ALy5cP4e5LiZjHg8vBOLvOy0bQVROoHx+HehjSOTQJ3uE7TzMO/fLjSHXn8d81uQaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by SJ0PR11MB6575.namprd11.prod.outlook.com (2603:10b6:a03:477::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 19 Apr
 2023 22:10:24 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 22:10:24 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Set has_llc=0
Thread-Topic: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Set has_llc=0
Thread-Index: AQHZcwN+/O+jsTJtbEaqtMoubVAd2q8zLbGAgAADFTA=
Date: Wed, 19 Apr 2023 22:10:24 +0000
Message-ID: <SN6PR11MB2574D2B3FB7F7B579F1762179A629@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-2-fei.yang@intel.com>
 <ZEBjqa0W9PflR9RX@ashyti-mobl2.lan>
In-Reply-To: <ZEBjqa0W9PflR9RX@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|SJ0PR11MB6575:EE_
x-ms-office365-filtering-correlation-id: 5012747a-4230-4022-3170-08db4122e01f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R7fASpAJn7JMJaSnA4liUaSIOYp7QUTtiF0YEx6onYdj3nn7ZFYERN8UDxemDIanizA9y7UAc0gftjg07YKt3LgWIiOkSp/RrJKZmlPF7NDkq1kfRESSAiS7DHEVwdnTo8Kq8eyZRcjvBZmWMmV17/abHQPkSGl5n5vS+h6pS+jhNb0eauDGnAA/QpucL/PUq8nn9sVdDZ1g8jwoea/QNqVWCUoDMDCTRl3JLs2NmqRC8YMvCKzgBg53bKukjBOIOIxCDcSrG8XyxZWXIM5BcOsSrMDZMz0KRrB9HGHCgC6a/Ey3xD1dOlqSQ1yd7QiodVlyQYQBiYEI3D74r8i5TyEBVr2O/WDRL6MntkFfR8CvzuZvDA/Si76ccV7smFhV6z2N4v8m62W8op4VPhoQ+faxmsb7H6DI1HNUfXbxWwJjQXc8mkiRozKt9OxsGePclCh2MiPKDHp1sVhxX9kmPJwXjoiagmrQTYt5NWERqSrf3pBsvPmhgqDyBGYCAbyEkuz2sStXYrFAOa8mRAbt4mTHHV7SKTF69FPeT9DX0yneUJY2ou6RoPGtYVcFlzqCyVtq53R3n1aUAscYY0KeJBIis96+pR7ZnMdyMgVFJLLXkAMpkdDaHNY19TbcR82U
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(5660300002)(4744005)(71200400001)(7696005)(66556008)(66476007)(2906002)(4326008)(76116006)(66946007)(64756008)(66446008)(33656002)(6916009)(86362001)(38070700005)(8936002)(41300700001)(122000001)(38100700002)(316002)(52536014)(82960400001)(8676002)(478600001)(55016003)(54906003)(9686003)(26005)(6506007)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k42bZcRHWVb0ZUFM+/yFQocOtZ+N0dksJtGmnBoqZJkN3DSsL6jGDdOZ/YkU?=
 =?us-ascii?Q?gi22LxjXV6OEvsCvveA8nAK5YyOm6fczNO4kfnD1gvhUDmqK+fxCSW+dqk+Z?=
 =?us-ascii?Q?3UdxB+RWLYzlCTyk/uHPNR0dCR1mOoMLQBLp+/+lAxcn6zvH/8hp3Dq/ep7l?=
 =?us-ascii?Q?njlck+1ANpzedBnD5SRV/2BI6dTzCKj+kafUwxEjA2cwh2OhPHNbWUb+iEzL?=
 =?us-ascii?Q?JTqSrGn46m/5Nm5Losg1bcuhbQXeGpR/GD6GRGthtsIlHclTZ26LiQ7IEb6o?=
 =?us-ascii?Q?HRhHaDpbp2WttpahC1umUqBeCRT9HQnLV0/qOkitSnvRtrPX/7i3nPPJ07Vn?=
 =?us-ascii?Q?f76GBKcSyEMRQDvcZVF4hgqXAw5sd+eU9vFuSsKsKIiVv7lX6615fQLu9E2t?=
 =?us-ascii?Q?U2w/btM7MtqNsYjyPb2JZbgTgfi0WW/IQ3dU9CoiApD2xYgGvh9IKC+3HqLn?=
 =?us-ascii?Q?v612udCg4DloTpNzREhGn8D67QyxzXQuXrOB59KV+mH8Zc69w+kHbhABRV3r?=
 =?us-ascii?Q?VkDfWj2XALieZ9+f68cIwQ7XzE0ofcQbquRgWZPePQ5+8p/WPC5wkMUhL6/t?=
 =?us-ascii?Q?6ZL6HRUdX7hfkEZ3rfnk4sJAFxdZWRumjU7w7ETiSFPcYdbvE67s5Bo80d/L?=
 =?us-ascii?Q?CnhSY9pyzMCPugJQitFdyq/Sm/uRhTcYXLaYBSuaPGnE1y0Kk3vmS13TaXVh?=
 =?us-ascii?Q?NUr5j3M6Bat8mhq2gUioWX6hYlhGYCFKYfa5Qeou3g2L1rJKIIkNGSl79KVP?=
 =?us-ascii?Q?8M4phNUedoP1wwaSdisEK+Qv4XyCHC+PkENL2ozdxgaFz0E5l+pi8BMtZiuX?=
 =?us-ascii?Q?Pa/Nk3Qi6LBAeVE+tH7txoAXL7hm1XeGL332dyavtxXa1omjW8f75fJGtKyD?=
 =?us-ascii?Q?B4m2OSCFrYL2Uevb3Hzk/OjvdHOr2bafxf/QUfy7IsOKn+Hwc9J60jpce+8u?=
 =?us-ascii?Q?I0FJp2APipQ1bd1LzTmvXYoCSdW+JFCKWwQweT4oGJ5g6KSTq0CvThm9kbTb?=
 =?us-ascii?Q?ftFo71YDG8OS/gkndNEW3+4RadtqZyOUTeGB/cEfhyowuBBcg5V8P3yEa0L/?=
 =?us-ascii?Q?fHxasBnHaAUSQpljQBQqrU5V8YRigR6456ZLhayJBwB6rhIJuSA1lHWT2zeT?=
 =?us-ascii?Q?q4fx0A0a93lFpGQ1Nglpncuv19PznXQ8UB8F1+SfxXw3enfR4gIQnJt6r+Kj?=
 =?us-ascii?Q?3TDFn4WBT65u7DpyxGgHRWR5xrrXI9GsrbLb6hqwBECZ978yYmEjjCT+CvjU?=
 =?us-ascii?Q?V8nf9JPikJ8TEWjS0vZ2UKT4HbBvWGIP1E4RDE042zekBflQ5A+I0kqgycWG?=
 =?us-ascii?Q?OzoBSUTb+yLMUQIRIIMssfEZKv3M8n+5932DrktFEjN3fzj2gkPEVqRD4C/K?=
 =?us-ascii?Q?sY/rt6EuJrwhEbBmGV0JfctzOZveo9LKT5kj6YM7je/zy8j/rriRpQ0Bp1e7?=
 =?us-ascii?Q?2mp1Pmf6AfhgopnzyXXj2CCpku2MT79oQs2MMrul/fhrDVYf8si21WftiK+H?=
 =?us-ascii?Q?oBA1OVLqxXm8kvs0uj2owuayYw3O/0bmm918oeKscmgc+AuCKQsYzrAigxLc?=
 =?us-ascii?Q?0PspvIyNxIjKvS9PRbRNzCKqBlmBMx8aFaqY1dAX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5012747a-4230-4022-3170-08db4122e01f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 22:10:24.7509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YEVu1SArbRmgexC5QyRfee5Nqogh1QSObGJQtPxnpknamR+RyCZTs12ldWGjicGGDZJ2fkFi19hTXJSZTH80Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6575
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hi Fei,
>
> On Wed, Apr 19, 2023 at 02:12:12PM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> On MTL, LLC is not shared between GT and CPU, set has_llc=3D0.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>
> just an unanswered questino from Nirmoy:
>
> This statement is bit unclear to me.  I would say "On MTL, LLC is not sha=
red between GT and CPU"

I have updated the commit message accordingly in this version. see above.

> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Andi
