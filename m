Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C9F7FBEEB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 17:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9E10E58A;
	Tue, 28 Nov 2023 16:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0BA10E15B;
 Tue, 28 Nov 2023 16:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701187530; x=1732723530;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n4FQMPux4UB2/bvmgAQSybz67feBXvKZ4BLzKEcYsoc=;
 b=UuLM9h85+PWEQntZZeueM8VQgpFCYyEqki/TD3JWDiTCBxbQWL/xi3K8
 IcFxLks+lwTqWHDgwT16JQ0+bFw1EDjlFZha0WEFasoUOG6HzzeZghWoO
 BzvMXWaCnoffcDoewITYWqiKPZImv/rc0eHTRlEN12+jkodemyjOJGNNA
 slUL4WTquMODhKkdDJs2rDufCBvzGD/Ig7O8zdVQCd9nz8fRaCzyLUFXl
 Nuq8Xa96ZqRXJ5KzsVJrYAL47CXzNQMMfaz+nf4yluwlHIUkJV9GUY1cl
 T4le9hYhr7odmW1Rnee8ERIxR0KDaIsCHRFrO9EQwm79i4aQmuwGfjjZT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="459458484"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="459458484"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 08:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="9989480"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 08:05:28 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 08:05:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 08:05:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 08:05:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 08:05:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWG+7YIHzYYOpobB9SizHKo3jXizDsaftn0qK45723cWc1JvlgAf5/W/yQ5oCoyZyM1HUcW5BNFo4CrB6Q5jhsqxtBEYBRJ86UIgFaCyc4iB6dELJSFxe4Gn5CIs0m3cq0SW0xYej6Igki9tSy4yZTnreeMe/XT/2DVM+qhQQLPWVDgVUnjxL6hci4AV/s3WzmHFop+rU4BwJvsaP8tWbrSZTwHYKZbHuIzRhwFmHPSTfxKJaUulVKp0+NCNENAtoS4Z4nb+ZEkovO9uzGDmwkte3WUrvOqKtRwmN4sFmAhdPPLClB1REeecBwLbsY6rgI602P08LHyP+oDN4+ejcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn09bnSKGuH59jurI7o6JVTNf91av3pyRWMXp5Q6gNA=;
 b=lgTxpxd2cWkHDTijB7ZDZrWcnukUuKwocchhxBNMdTEWYbuUzgvrdtZMxKqvyOoXeHK26dNXwfSKWU0C6GTECjaecFW+8lRkxyO299fCY7nYcafSNrSb4v+PmBFRYhrQ4U9n5LF/Ekx44YdkDGwim5ld8n9vNf30akW2oweVvDqz595g0pw7OER1DRHwCafU1LlIS/Ix9ZavBBbBcRjTVYGxJnHnx5WtCPhXe/o5w7Il4zS5BboF6AteBfGr+9WEi/XiIDWZjHLi53qbAlIRhVsdZKLJ3BNsY939YBFnLJ7UYIHGkRnKj5BbAFx4mmHdBwk1y31YVZ4mZvGyFSIFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7990.namprd11.prod.outlook.com (2603:10b6:510:259::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 16:05:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 16:05:25 +0000
Date: Tue, 28 Nov 2023 11:05:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH v5] Documentation/gpu: VM_BIND locking document
Message-ID: <ZWYPvhDzmqipdhC/@intel.com>
References: <20231121104046.3201-1-thomas.hellstrom@linux.intel.com>
 <ZWTvohD9rTx9aAWa@intel.com>
 <03712311650b5fcf7162309f13a18dbd240e8a9f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03712311650b5fcf7162309f13a18dbd240e8a9f.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: fde76c31-5a4c-474f-f338-08dbf02bd4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWegBw+PGkd5LFkxumqRyIRf2V5Ig+fggMmmUL08FkydFFzktqGyXJuOJJbl3zsb7tptMJHIg+Y+3TFqw6H9Ak/wTysv33+7i4SbbVdQsKSv3X3qZHEIuuKK6WkOB/jGTOxPqsAZ5p592e4GrMDxts2Px6QR8fXjOdLWLJojIFpvQVkhv/5JHELbBwzfGyZ2nxP9sw2XCtL0BkwGG0d+lSQbXeJ4Ah7OF9Wk7whO2GLrhR8maUSSpbatz1L7FCE3jGpCB3xFykVR/aj4E9tSGP1fbM74pAqBAe7W8zHBKeERMWxprq01GDSmLjWq6rIKhOsxmueq+EiMK+Fw/m6qGh8JbNUnc/rbD5MbDJDFdG7RI6jpFFPWvne0aA1gQVjy1wDXOldhRSpK1pH+N4Zint7vxE5Sc6lWlrgwaBHPhJ71EMFGvkck9BinvW1jaoJZR4LxbW89JULvV7GpFrAFa8vdvN5cI3u5KfLiXXjmZ+3fa85uFrVmgyqxEi+JCH1bzXFE1oJDy+7sJL5m2TyeDit22K9Y5gXC+3ONiExkPPQTscNlgxxg0zMwriuEYvvK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(6506007)(6486002)(2616005)(478600001)(6666004)(66574015)(83380400001)(2906002)(4001150100001)(44832011)(41300700001)(66946007)(6916009)(316002)(54906003)(4326008)(8676002)(66556008)(8936002)(5660300002)(66476007)(82960400001)(38100700002)(86362001)(36756003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1snx0pEL7dTTfMQ+Q8Hbr4at2cgWOuEJIaDgxoJat50Dr6OQvD2ZeSxWX2?=
 =?iso-8859-1?Q?p2QoPkKokojtdYD3FDHMbpYbdxW1bemTerElzMoJeEo0FF7MN4vhStmvy0?=
 =?iso-8859-1?Q?ETb2bDraj6tLRIudHIw9rLRZFiTIMoppuwA50YTssR9CxTJi2zkGsQMRdx?=
 =?iso-8859-1?Q?GXDFHhZL7YSbm3qN3W6RVL+yU9+lU7E9ZxXkW6ov2sWRADV2G6PP6RWvEf?=
 =?iso-8859-1?Q?DPUWtwQ2D1axHCcGTjN6LJGIzzyTBxknGFVZZdDsokCB0U6MS7/MJRDzxC?=
 =?iso-8859-1?Q?paVdOe/V0PH9452hEf/IK6FK0A6LNg1mhd1PpwOQQ9rKsLg+cxX8iacRXt?=
 =?iso-8859-1?Q?JoaAKoESz24uqafQAEgug9N/q2pZVmi6m8IgAco7EbEetsvDaIIzJ6qF1P?=
 =?iso-8859-1?Q?BDcVAeVavnB0aj19rkHKgcBGLW+SGjF+dHikBQDtEYWeDGFpqMC14oWbOX?=
 =?iso-8859-1?Q?7It1zg0jU0PqRx2f4hwMgI6awYqEzXZdmLqyIBrL/8uLLeJpq6M8Tgm//A?=
 =?iso-8859-1?Q?d/xVvcnLPmu5OnVy2eZlD4bWkGpF7+ufyWZ5WmnVVLY8G6UtuQ4SCQWfrA?=
 =?iso-8859-1?Q?kEL5MdL5UZOksbXHLynaggDcH1aiZQKDB/VlEHI7q5JwBLPw5P5YI8EaPC?=
 =?iso-8859-1?Q?aJRTHGbWLrtZPHrBv3Lt7P4krXzZMrkzcP6mRzc3j7MBNISoXJcfT4otbf?=
 =?iso-8859-1?Q?kt3/VYEWSK2ygf4X1Hjc52ZrFrytsy8K5O05nKmSWuS5CnvF5gx2F0buTU?=
 =?iso-8859-1?Q?bMfaJA7rerJ0M2RqDc0CKnsFL5rjREru7iBHbGYl+M5Qx2uPdH7fXWmaJn?=
 =?iso-8859-1?Q?oJd9ZZiFQNTb+q3qBdsR2YXCNWXMGLiyRVlHlP/mbmA/61wLFzomCjNsiH?=
 =?iso-8859-1?Q?bOzZlkaVJ981be8ruL0NFDeBEy847Ik6cWfi4PrejwHJewXcA9rJIL+hGA?=
 =?iso-8859-1?Q?kjZCFju3CPQ+TXr6RnQhjxjyCp05tA4hF17TtPvL+Ac+BKElBxwHr6FMEc?=
 =?iso-8859-1?Q?D7x2FNytZIGaicFmJm8DZmZm0uNJFzXE65eeYjbZVloBbHxATSsSK+qA+S?=
 =?iso-8859-1?Q?hp3djBviP8/v1Xi7tOf7kKUMCTwI2ZrpCfmyroZ4wQz2uuMHJuz6Dr/bDM?=
 =?iso-8859-1?Q?/DO6uddSZbHFSsJ5WkkzLIWYbA7GN6+68U4gfky1Pn7zzt6dnahhpbtBDz?=
 =?iso-8859-1?Q?EgOZKBFjVyYFincWBbNfoc7T3xuZT95trUlxY0bt87+vlhHFjwwODRH1HE?=
 =?iso-8859-1?Q?gkcKzghhllxsmv4G+WI59mMSMY8h8GLL1Qh1QiZq+CPzWCj3caXtj8ipdg?=
 =?iso-8859-1?Q?Avv49b0CPy5UpESNDUIZdbw99AquFd6R6WWglx1qwag27XD64mOQal44CG?=
 =?iso-8859-1?Q?7AloCphH+eEEAYxSJS/3NncZbQJ/QA5eQfz2Y7iA6bBa9O2luhFh1+gFQZ?=
 =?iso-8859-1?Q?9OsVI4gEs4Khe/uCak5SF9VVLRubKnEn2q4dyru7cUrCg2aomkyhunKn3j?=
 =?iso-8859-1?Q?3YGtfcd+PENB5By7cx68wIcsNxBtpRLkVeI941Y5y3KzVPcOihcOZlJwZS?=
 =?iso-8859-1?Q?R6sQKsNFCognhT7fPOrvpVbGjMTcmlnVlhSygBgifJyAfEvHaG0gPCrTny?=
 =?iso-8859-1?Q?EmRV6LrtQn7rFkBksKZ6ulXahozR5JuEbdKmfjaaJoiZVG55fDC7hnww?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fde76c31-5a4c-474f-f338-08dbf02bd4c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 16:05:25.1383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gg9V/zEhnSwmwAS65xCsSHvPhf/g4qkc83IUWiF9IDyePZZQ8LzsqnzIb60zSvlwjTKwtYsQMsMAWwXdJnRNfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7990
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
Cc: linux-doc@vger.kernel.org, Francois Dugast <francois.dugast@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Boris
 Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@redhat.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 04:51:25PM +0100, Thomas Hellström wrote:
> On Mon, 2023-11-27 at 14:36 -0500, Rodrigo Vivi wrote:
> > On Tue, Nov 21, 2023 at 11:40:46AM +0100, Thomas Hellström wrote:
> > > Add the first version of the VM_BIND locking document which is
> > > intended to be part of the xe driver upstreaming agreement.
> > > 
> > > The document describes and discuss the locking used during exec-
> > > functions, evicton and for userptr gpu-vmas. Intention is to be
> > > using the
> > > same nomenclature as the drm-vm-bind-async.rst.
> > > 
> > > v2:
> > > - s/gvm/gpu_vm/g (Rodrigo Vivi)
> > > - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
> > >   (Rodrigo Vivi)
> > > - Adjust commit message accordingly.
> > > - Add SPDX license header.
> > > 
> > > v3:
> > > - Large update to align with the drm_gpuvm manager locking
> > > - Add "Efficient userptr gpu_vma exec function iteration" section
> > > - Add "Locking at bind- and unbind time" section.
> > > 
> > > v4:
> > > - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
> > > - Minor style fixes and typos (Rodrigo Vivi)
> > > - Clarify situations where stale GPU mappings are occurring and how
> > >   access through these mappings are blocked. (Rodrigo Vivi)
> > > - Insert into the toctree in implementation_guidelines.rst
> > > 
> > > v5:
> > > - Add a section about recoverable page-faults.
> > > - Use local references to other documentation where possible
> > >   (Bagas Sanjaya)
> > > - General documentation fixes and typos (Danilo Krummrich and
> > >   Boris Brezillon)
> > > - Improve the documentation around locks that need to be grabbed
> > > from the
> > >   dm-fence critical section (Boris Brezillon)
> > > - Add more references to the DRM GPUVM helpers (Danilo Krummrich
> > > and
> > >   Boriz Brezillon)
> > > - Update the rfc/xe.rst document.
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > First of all, with Bagas and Boris latest suggestions, already few
> > free to use:
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > But a few minor comments below. Mostly trying to address Boris
> > feeling
> > of long sentences. However, take them with a grain of salt since I'm
> > not
> > a native english speaker. :) 
> 
> Hi, Rodrigo.
> 
> Thanks for the reviewing. I've added most but not all of the
> suggestions in v6. Regarding the comment about "zapping", that's used
> by the core mm for the process of unmapping page-table entries;
> zap_vma_ptes() etc. Merely following that, although I'm not really
> against using unmapping etc.

Perfect then. No concerns from my side.

Thanks,
Rodrigo.

> 
> /Thomas
> 
