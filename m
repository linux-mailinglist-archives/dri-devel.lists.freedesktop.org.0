Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F359967EF88
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 21:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786BA10E2C5;
	Fri, 27 Jan 2023 20:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A306910E2C4;
 Fri, 27 Jan 2023 20:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674851171; x=1706387171;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NzVcT5oHW04sZtCZCrYPmBvP/9d2U4621Lljtdj6hew=;
 b=O1xit20badj8kZ6fr7bLArUcMLRFc4fSysptM4wEAG8R//fe9zXCfc6V
 q77LKBojTlRPW22D+8vFy7KtSwo5yGeicaxCL8tJuF2BxoSw24HnSorUu
 HlY11fu8MmBJs1h50Y6DMpd8ugYYJ48/LObw+F7pXz7UN3IVhl4mtyS2F
 VihhqYLgrysZPi0oWGrLfDuSjSCtDJ5HD9F4/RqpfASz61mNAEjd/Dd7t
 k33afQ/DlEBak8E5ZYAnD8qyEv1jzIlpFN3G1pffJAQLN+ouDqZflD3vK
 Nz6a5q9axva572MGHmwSdqtpY8/s+ahO+EaaYDn56wuhyABUvbmY5dYG5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="325854353"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="325854353"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 12:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="787318364"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="787318364"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 27 Jan 2023 12:26:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 12:26:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 12:26:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 12:26:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MziJUNCpxciYnyfNXd676StJBvhiHBJOdnezYm0ZTq4YiKvU9nPALq/XmX8seAUr7AtOSEWIIhb4kKVOjyEMCUcZdiq0IahNP9Ve7dXDMoWrnyMQtPXYiSxMlAuvKHwAAVtuJABanveRwA+hXvNJ51OSQY2sp1NKQOoWn5DHFJQ08qGXwvHJSi75B63Y2YnpZQYd+Q+9Y11G5ZPFZ++xBPDglWHd+wNoW4AzyZBfH+TJNwVsa5wTehs1q/yTbJSudwMFQbfum+DmGsnjrXsbkX7IG8kutZRFoIljAH5BoZ1DktlrQ0ijXDtoh7ffG0Ca7rRXSNhkKEt+thtGS7JVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bfsje09D+LyLuKbLHTZsefiazBGepUZBWnduJEY0L2o=;
 b=cuYNAhxuEZ95S/KZ3UzBl/69wtbtOy/YbLJavYrxydZ4PKVQESvAek/2q6IWjfk9/EfBz23Ray6gPKWxTJMdqntGqcN19P77vcRlzjNMqnFyIHAlLUrs+aNxP9rfLEro8v8dLMyJavRhWX4CWwBaV2ZIUT626eFtEUJwlxZV68s38iVsIfK/qr2pmSe08lmCVy3cBaVJ5WfRQTeOSoib7K0reAu7Vt4YbCl63W1P6fziKqg6BkLGQZzb5PGY05+mj6cNuMk3Ym62uQ7QZTUwOtWMtnK5SzRDKIP6x+CZXrByHQf5G3x73Kz6VFKciKkUIfMAwYWWKCk+sSVMtDFTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 20:26:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 20:26:08 +0000
Date: Fri, 27 Jan 2023 15:26:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 3/6] mei: clean pending read with vtag on bus
Message-ID: <Y9QzWg97bvxvJ71+@intel.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
 <20230125082637.118970-4-alan.previn.teres.alexis@intel.com>
 <Y9FmvUujJeijwZXi@intel.com> <Y9OUy2Ygq2EBzdDV@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y9OUy2Ygq2EBzdDV@kroah.com>
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 7528047a-8868-48b1-2a14-08db00a4b8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgWPqGLQHUvDgaebYxZobqGlX/cXBBnzsWXQkLtO0WLUBDBgVaF2RStEJ0E3RlEIXtE5D3L8Xu3gzhkJZUvVmcpppLy7aa6UlhjglOLtDDxuVZaercqPhzwrm9P/SsgTmt1InOkNldhQlCu8Fi5w4IHdWoR9rz+GpaQG6XGVaaV/TbOnQYqM9doro5lV4m9ZEGxx/qWHaFexRioM3lFbZRoRI0+aTrsQdMQqWt7AlykVoLk+Q7u4THWXE3+QP4WFi2YjLZRAM83f39CgV7+U0Z/6VHCBdvAfGiF2ruausciXnKw6qP1K7uawlZWoBny519AoJU9hZzNHPlpmpsTP4q+zcUGxj44OGRYm91sKOjFH8DEmdPWqTk87UEqxo9AUCcIzMljosnfzmLQaqmaCynrb2VnU1m2YMU8cslzgw49cQKBzRYX4iu+F7LKpD/dAwlrccpMeoIzImyA1K3ZrH2dW5Vb1dkyTyoJpqdOpGYHK2vP1a3g3csoc+fUJquh0jmjWCrOebJwg36c7nQXHZHQkl+rCGEWbCoEkufYIxDz0lw7JhgivcgIf01HeE2ssdxnzgyacGSksiDuFGGxkuY3dOEJL/g6uTrMvgOw8d3qvTRQnQC1xxIi0EN5ZtVP5SQHSUdqYuLlVxe7aZ0aO1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(86362001)(41300700001)(2616005)(54906003)(36756003)(478600001)(316002)(6486002)(6512007)(186003)(6506007)(26005)(107886003)(6666004)(6916009)(8676002)(66556008)(66946007)(66476007)(4326008)(82960400001)(38100700002)(2906002)(8936002)(44832011)(4744005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aja7m+X9HyXLocjulDpXJJjBUC44pPLikJsOeFjw4nxaT8E2NDd8SKg+osaW?=
 =?us-ascii?Q?ymQjNwH7youQDafAR9FoZjPoj+0MT3qvhHyLNVBsBoKn3lHQ2IZNCrGnW68l?=
 =?us-ascii?Q?40zaurHVACoiHFCuEKnU4b3coSNcd+wdk60EE+2HsoOJdJGkQLeXlps/4zCn?=
 =?us-ascii?Q?Z6nH+OpPq8OThuY2rrqKB3ifn/aJaqy4N5GNcdYcQbGlKDmu+Z0Aq1fetkK8?=
 =?us-ascii?Q?p6GGRJ5QODtXi7jVBXddq3FQwgVuBNFVoYSG74KKL4IhraZvKeC1jMnJTOtv?=
 =?us-ascii?Q?AEre+sLr6jiVJvMrh1sZZPIgHchIhA97sLdAG7Sy+NPMJJ8R9c66ycbvkmpJ?=
 =?us-ascii?Q?pbhga+KWNCrp7Qct8r3cNEOId5xTn3qrD1xXgfjb/3FWw8aPF7Lcx2R28Xyd?=
 =?us-ascii?Q?uqXaTbTdOl9/9+Qje7AC26g2TZZmimG2EMC9VK33byndFkoTFauxDwjGFyTJ?=
 =?us-ascii?Q?FzK7FsALdZFOioqqLNkoenmxMtClaFVjlF657jMoQmoeV5BLiQYVQb9/Drj8?=
 =?us-ascii?Q?PYHwWaj0rD0NOtYzmQK2dxZKphEMTlkDRgM/YsDmmZ9mtoIXqAaZsQ7cbuYo?=
 =?us-ascii?Q?+EczaLGpWgoJldEJPgxi3LTRblhFQiHG4HaGMuIFnWbGxFssGOF0ftYJhWLY?=
 =?us-ascii?Q?cebRLtaEUNu+Gasi/YF94dIOKvneH00kLd6dKlAodVSyj/RK6HJHQGANm0z7?=
 =?us-ascii?Q?p1GnCfaSdxpuHgEcjDYf3sSBGd/DcTA7sg8OBZ+9nUS03WMAPUssGgamhrME?=
 =?us-ascii?Q?qM9e/Glz8vy+sMTQm9qfbxadM8LQmacCYOiWf0dFIfn0+EBMxVllckhXNU+R?=
 =?us-ascii?Q?18jokDrLRKmlBfJDqH7wRmmDwMLu5efowT+TACANSp3njYiUuY4RIEC2JjkV?=
 =?us-ascii?Q?Q92kN65+iBqvv+jKLYMAySZDsyDKEg1uCVtSKAyqnxeqeyPbiq4i2PiaxiwW?=
 =?us-ascii?Q?mqF4RXI0x3TqAj0+RhmKeU00fDUFm6uLKCKxda/Yh70TeyujakSymXEfIBaF?=
 =?us-ascii?Q?prl/Rbrvbe2Pywb8KKsy3u4+qitZk12R9mSsEz1jzXYgSK7VdQiwJNoMk9Yg?=
 =?us-ascii?Q?KedyDLO/olN6XzbXNTgtELU0CACkaEWQ/w3+DBTWvI0QxCQ2DHeq3OZYj08E?=
 =?us-ascii?Q?N256MJXfGBMA40li5aPQTi7NzRz3mLV6n6N16eUnG4xGbR0eoKP6nP8mF57q?=
 =?us-ascii?Q?HtF7LmAdOrEoX1fcCcq8uI6nrc4RY3IbDL/Y0iE8yGoqZsxr0M8he4vgjF83?=
 =?us-ascii?Q?bNOlhEBcU0FRNxCVDwRcHVmvzkb3KgGra8a/AtaL6J/J7JBzckxgSoEuVylP?=
 =?us-ascii?Q?agSJJGTxDbCWXfEs99g76GR0IWYzr+JeTeBp8ZDx0XabkF7Iktinv32CWFVk?=
 =?us-ascii?Q?DlSk4XjX20rl3fRMvYTkngetSNi2kDWMaxE3kIR9QiEn+68jxm1c+q8FtQBj?=
 =?us-ascii?Q?I82Ay/jb5J9pU4uZx9WfOAQIXJQhj6ldxWW3AZqEE6Qmk6S2WG5ILIIhgu92?=
 =?us-ascii?Q?U0YPFP7K4tCu1rj2E04VWbV5O/tZy/KRTRA0hky2sn+2vYQ2JZX+/uEWjjma?=
 =?us-ascii?Q?4ZOKbATZGtPjWUbzxaaqLz3WkQs5hH5uW0zWNDvma2crYiPZtoQi57VeUSZJ?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7528047a-8868-48b1-2a14-08db00a4b8a6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 20:26:07.7634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBWvzK2HIjyikHvUdyySezvebMGg5+C/5TGCw2k2N88z3nudtIS7Trp796h19xIPSVnNLyOgGBM3nKHYJLD6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Juston Li <justonli@chromium.org>, intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Daniele
 Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Vivi@freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 10:09:31AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 25, 2023 at 12:28:29PM -0500, Rodrigo Vivi wrote:
> > 
> > Greg, ack on getting these 3 mei patches merged through intel-gfx?
> 
> I only see 2 mei patches in this series, what am I missing?

right... 2 mei patches only... sorry for the noise and for the top posting.

thanks for the ack.

series pushed to drm-intel-next

> 
> thanks,
> 
> greg k-h
