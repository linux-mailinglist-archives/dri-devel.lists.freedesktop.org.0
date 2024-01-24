Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A774483B3D9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 22:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BB710EA86;
	Wed, 24 Jan 2024 21:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C854B10EA86
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 21:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706131461; x=1737667461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lSvD3t9W4jAlv/a0hDljTi6rHZKaqj1OCiOGk73e0Vg=;
 b=IXyI/Oq2mhfYTvIhilwBvqTU81naab6xFW85ArWymLszIIdtqigaZ1Su
 eZOhCitMno+oX6bwMO7J4ooXQAPFZLQv3X8ZeIq4UYj5nnrZb07eMHIQ4
 GpAxRsxYAtwCr1XUHn49JjqzXAs/026YZhiXRUjceMKsI743nFk31o6cy
 HaUEkHhYzv0/nnbcoiZRm0qW0hppHfwRXqTxZ0C/pRaep1tK73p2Zq+NR
 ON3e9z77AZqr3DpivbKardViH/1DHuuBB4l1TNXXCAGUNlA9D+2yuX47Y
 SnpNbSpljgLDkRF0wCBE8oFb8bexy+uHk6DbmDEmG41Hv+nUx8TwAiT3W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400835111"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400835111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 13:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28531836"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 13:24:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 13:24:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 13:24:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 13:24:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 13:24:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Im3vFn6IoNwcVEqps6DFnpmTkkf/L8FX5ICmoQf9rRNgbWiVCKB3nkMW5LCBxD342hs6yYljvKKWgTymJwHOI7WDVY0lcpM9CTjTBvWhMjt1CT/tGrd9OjMqBfXVAmucCiyRrDoDmjTeanqnuAZBcbPwh4PFuVe3JCPUFhJjbXWiEGsp7ggBhQdbkz4z48CWUKEw927Ge35j0wT5SZkQVLnSfEFF9WOLx2UJ5WhbAmMLbBdmX7W/VMUQbOlYabrd+vrB+6zCiTAuPMGD8uZyb39nH1TmhZ3IAJYcCc+1VZ31kv7JSYYeLRkzRbHS2Ige4mUAywPmRQWrmv5dR8k0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF5q+iFV7ygoBvPET6GA3c+AEV1MSpNG9fTNv6RTy8U=;
 b=jawaEYxGXvcr3w3GmPp+7D8GTuSUX4z5SbQUuFrvrz19w8BdM6yTuGD9Ie7tsHmzzbM4U6ewK6sl3P0v3NxKhb/GD6BidBiJd0CzILWgjO2jDlrnI1eHZem+iDgNVZm2oTZfzA9cGIWljtub9bMxIhpn3QyObsdpzevmr8X2xbRZ4/vxqLkyrQ0/pinzITQyBPAazylm9nIzK8p9/Uxdx4HkScRLsOR5YDalw/jr5XEJucLI+/hGmpb6WXQr1FCDoTaumOdCHrxVCsJJTFkLgGVpW1B/MDVUO92H/aHocbcBKCreZPrNVp402DaJ0TPdPgK1+J9dWU75qfP7x04OLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 21:24:17 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 21:24:17 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Sebastian Ott <sebott@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND] drm/virtio: set segment size for virtio_gpu device
Thread-Topic: [PATCH RESEND] drm/virtio: set segment size for virtio_gpu device
Thread-Index: AQHaTigSom+Pto7E5U++tm9t0IVe9rDpepuA
Date: Wed, 24 Jan 2024 21:24:17 +0000
Message-ID: <IA0PR11MB7185B400DD4A4FD65FD51437F87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <7258a4cc-da16-5c34-a042-2a23ee396d56@redhat.com>
In-Reply-To: <7258a4cc-da16-5c34-a042-2a23ee396d56@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH0PR11MB5112:EE_
x-ms-office365-filtering-correlation-id: 1e19cc61-0438-48fc-09cc-08dc1d22d248
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gETjDQj3tQ/+j4HbwT2cypOHAkd0Seaag/E629bKkjB+K32mVFgJNdQeaFP3pmILnHWZ+ufZ3DrHHihwjXSVqvSN5elPkogF48rUKIJ25hL109qwjMaxEPqiBUWlEcMVQcoVpg9jIgO+p5ESxwQSP8SvejrGFEEic2Wsl9ku8sCPIFVYS5RjzwWxKDhgRAZFvLXkvl67T4qkm0L/UxMUenYEQE+KONR3i0kT8aj6edC/jDG39Z34Z13/K+aU+zCAGynJsMNBWK31F0T6nHZEZe8kmqav6teidnM4v2PIHlO4S10OrWTqDG2XMmy5C/bR1X8fYAISgiayvz41/uXfVFFjmdOwmpmyteAmThJzO5Yu2ADriYb95ybAYpr1/0pWJ6htUYfyMIgvBMtrV7CIIuO4DbpPDEPeydPvquCRpxRtrti9ioGkZDLF89BT9zo2uHG9t4QgNH8sCurB9p6uzemLB2Bwfo3R5xRaJ3NX/Oqn5hvJqWS2FIP8VvSETEOD7kgNqikIiHKl1GKXNCxfB3exKNXUWZ3w68USe1h80BjGB7NCah1TF7jdZ+BRqLIXx/G66V9ZOstbcdVieUqM38WPg+VD1kTTqtVSbjdae6vPwpMSNH1N9wipkOTo3/w7mYsmuwnk8r25Zo+A264z+PPBc0NUqt1+BKVpRHjPGrM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66446008)(82960400001)(66476007)(54906003)(316002)(110136005)(9686003)(122000001)(64756008)(66556008)(66946007)(478600001)(38100700002)(45080400002)(76116006)(55016003)(7696005)(6506007)(8676002)(8936002)(4326008)(52536014)(5660300002)(83380400001)(26005)(2906002)(86362001)(33656002)(71200400001)(41300700001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UkJG4BOcOiYT3+TXttqubsvUJg8TdpGa9ekySdhzyZlQgKpLkYaGTQIZQMre?=
 =?us-ascii?Q?xQHdtyRxHqrBoEG/6ieCqJwJM8qsG2eFjbgB3YXxu5kPEGSHL67GaJMjwRT/?=
 =?us-ascii?Q?9NUSP0dE/mb/JgH3dAekl54LaCvS3SGQDCPKxlRHv2io6o88I1rEOXHXQ2Px?=
 =?us-ascii?Q?2hlSYDuhUzvG6o2k+qQxkrEZ4PWnBa/urqK30PSrYot+bDQaAavZVeN2SHDK?=
 =?us-ascii?Q?J17waNITRCgmaUjZ44tjHM3saoRYyZq5vUxl1Rwn/5oebdFxe9fhlldbwpat?=
 =?us-ascii?Q?voFsfXjXLYjXvYFCNPVPGQVDMHY0oCaCeaZdSfgswTtlZNvdeCIbm+xKZLQx?=
 =?us-ascii?Q?nNcStt+fWvl3V4BgqKYPPetESnY/F9FTXFgjkp8MBUnLoWovLEc1sR0fDM4o?=
 =?us-ascii?Q?GoQ7W5rbSwfblK0X+rnojMeIBn58DTH7GRR5aBB3dNC0s7BXzzUBMGDJGY7p?=
 =?us-ascii?Q?XB1ujiYqbFCb355Pdsq3KNgSRBzaGFs35u5L4mbn5tbXZvSxo4rAkDl4EfHS?=
 =?us-ascii?Q?FKDKjnI/dYlv5QAMEs4D44hz34tKqOmInRRBYkgUlNoAXGRyAO+ltS01lzM0?=
 =?us-ascii?Q?kzHutYizGwkYnyYruhUtCXezeAtvUxwLqZS7gKrbIAyvoj4KYPbpvF8A2FuY?=
 =?us-ascii?Q?pRsM40ghP+h3Olotfww0l1sTAB14n4oCLml+lUHApDqQYtOwX5gJZ4EIY9Yy?=
 =?us-ascii?Q?zE2ylWyo0UpcoOwxxk/Idxs6HUGhe1iqo5y58qGjBcwsnSBGJhrCzVUVOsCh?=
 =?us-ascii?Q?F2uzfc93sJqsUsHMFKnIiMXx1AUlg4tuPRs7bWsYh9AgCZrxa1ukl7n3vxtv?=
 =?us-ascii?Q?lYnWOOIYtM1MaxPF7jtxpNbwSP9lPglZVfkQZnE563H6M4WpPQkSNWIvYGHD?=
 =?us-ascii?Q?Fw3D5Wx2/PodC/Lp+gOXFSn69s5jV401SEfQATutdj2qphJccisJr9B+MOzs?=
 =?us-ascii?Q?1XLcP+DOcaCB6DnpeY80oGpTuuUII6kWalsYCAkqQBJEkLdqVZIFiIWjDROH?=
 =?us-ascii?Q?B4TUZ7fr6huyBMPzpL+ppkl/h6W1v/nAxr9zGR5opA2LwXTYe+3a6wOsqT4K?=
 =?us-ascii?Q?icWkCgb0A1HsO75g1cFHxPxUeawlqvNyxX+lduXEqVoEp9ZvaOVQ+uLhQ8A6?=
 =?us-ascii?Q?S4uOvSd1ZYPllMxBFO4dSV1OynJD83P+wbQTxfXTMUVYdyBmFtoGHiBYfmk0?=
 =?us-ascii?Q?4BOZaKEDLGK/3iExt61tHTV3jGgWmC/jLuOdXf4y7hTCRZFZs+Fsl69eEIvo?=
 =?us-ascii?Q?YV3L8/az0xnqhO/DBfsE++cwC7cwfZY+vg05v6SAok7SwegqhfSgQQfLXsYD?=
 =?us-ascii?Q?UvzKHdjGeN/PuSfjra2/8CzNU/7DkaGGda7hGhEeN8gQ2zNZM8RiLqpvaLSU?=
 =?us-ascii?Q?hDCmorwt+4plmYLOiCHB1BV1vrgkKXMoDjGvNeackR4idRtJNbktPXtSX/gb?=
 =?us-ascii?Q?/s3asKuLU3sNKrLgNl1cJqg+Skq/cAVlDtoY33BpyYAGiaHukic75MfX9p0m?=
 =?us-ascii?Q?83iKIVhJYBw3IfmeI25KqCGOxtyQdd7mfp3eZ35ixu8ZRoLA4lFzoPPiIAYW?=
 =?us-ascii?Q?y7AJ9bpV27wiuxgA2Zzoc6n2/Q/7it6iXxEmXn2e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e19cc61-0438-48fc-09cc-08dc1d22d248
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 21:24:17.3439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4c/vJH+6drpzsQeop7YDw4/9h8s6tC6Ra3f9V4AfxkyBM6emb2/y2iuHuST/LTm6ETP5tHMKYKCqhQhMLFRo2KSX0j86kWcPi4Og0ttneiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5112
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
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hej,
>=20
> debug dma code is not happy with virtio gpu (arm64 VM):
>=20
> [  305.881733] ------------[ cut here ]------------
> [  305.883117] DMA-API: virtio-pci 0000:07:00.0: mapping sg segment longe=
r
> than device claims to support [len=3D262144] [max=3D65536]
> [  305.885976] WARNING: CPU: 8 PID: 2002 at kernel/dma/debug.c:1177
> check_sg_segment+0x2d0/0x420
> [  305.888038] Modules linked in: crct10dif_ce(+) polyval_ce polyval_gene=
ric
> ghash_ce virtio_gpu(+) virtio_net net_failover virtio_blk(+) virtio_dma_b=
uf
> virtio_console failover virtio_mmio scsi_dh_r dac scsi_dh_emc scsi_dh_alu=
a
> dm_multipath qemu_fw_cfg
> [  305.893496] CPU: 8 PID: 2002 Comm: (udev-worker) Not tainted 6.7.0 #1
> [  305.895070] Hardware name: QEMU KVM Virtual Machine, BIOS edk2-
> 20230524-3.fc37 05/24/2023
> [  305.897112] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [  305.897129] pc : check_sg_segment+0x2d0/0x420
> [  305.897139] lr : check_sg_segment+0x2d0/0x420
> [  305.897145] sp : ffff80008ffc69d0
> [  305.897149] x29: ffff80008ffc69d0 x28: dfff800000000000 x27:
> ffffb0232879e578
> [  305.897167] x26: ffffffff00000000 x25: ffffb0232778c060 x24:
> ffff19ee9b2060c0
> [  305.897181] x23: 00000000ffffffff x22: ffffb0232ab9ce10 x21:
> ffff19eece5c64ac
> [  305.906942] x20: 0000000000010000 x19: ffff19eece5c64a0 x18:
> ffff19eec36fc304
> [  305.908633] x17: 6e61687420726567 x16: 6e6f6c20746e656d x15:
> 6765732067732067
> [  305.910352] x14: 00000000f1f1f1f1 x13: 0000000000000001 x12:
> ffff700011ff8cc3
> [  305.912044] x11: 1ffff00011ff8cc2 x10: ffff700011ff8cc2 x9 :
> ffffb02324a70e54
> [  305.913751] x8 : 00008fffee00733e x7 : ffff80008ffc6617 x6 :
> 0000000000000001
> [  305.915451] x5 : ffff80008ffc6610 x4 : 1fffe33e70564622 x3 :
> dfff800000000000
> [  305.917158] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff19f382b23100
> [  305.918864] Call trace:
> [  305.919474]  check_sg_segment+0x2d0/0x420
> [  305.920443]  debug_dma_map_sg+0x2a0/0x428
> [  305.921402]  __dma_map_sg_attrs+0xf4/0x1a8
> [  305.922388]  dma_map_sgtable+0x7c/0x100
> [  305.923318]  drm_gem_shmem_get_pages_sgt+0x15c/0x328
> [  305.924500]
> virtio_gpu_object_shmem_init.constprop.0.isra.0+0x50/0x628 [virtio_gpu]
> [  305.926390]  virtio_gpu_object_create+0x198/0x478 [virtio_gpu]
> [  305.927802]  virtio_gpu_mode_dumb_create+0x2a0/0x4c8 [virtio_gpu]
> [  305.929272]  drm_mode_create_dumb+0x1c0/0x280
> [  305.930327]  drm_client_framebuffer_create+0x140/0x328
> [  305.931555]  drm_fbdev_generic_helper_fb_probe+0x1bc/0x5c0
> [  305.932871]  __drm_fb_helper_initial_config_and_unlock+0x1e0/0x630
> [  305.934372]  drm_fb_helper_initial_config+0x50/0x68
> [  305.935540]  drm_fbdev_generic_client_hotplug+0x148/0x200
> [  305.936819]  drm_client_register+0x130/0x200
> [  305.937856]  drm_fbdev_generic_setup+0xe8/0x320
> [  305.938932]  virtio_gpu_probe+0x13c/0x2d0 [virtio_gpu]
> [  305.940190]  virtio_dev_probe+0x38c/0x600
> [  305.941153]  really_probe+0x334/0x9c8
> [  305.942047]  __driver_probe_device+0x164/0x3d8
> [  305.943102]  driver_probe_device+0x64/0x180
> [  305.944094]  __driver_attach+0x1d4/0x488
> [  305.945045]  bus_for_each_dev+0x104/0x198
> [  305.946008]  driver_attach+0x44/0x68
> [  305.946892]  bus_add_driver+0x23c/0x4a8
> [  305.947838]  driver_register+0xf8/0x3d0
> [  305.948770]  register_virtio_driver+0x74/0xc8
> [  305.949836]  virtio_gpu_driver_init+0x20/0xff8 [virtio_gpu]
> [  305.951237]  do_one_initcall+0x17c/0x8c0
> [  305.952182]  do_init_module+0x1dc/0x630
> [  305.953106]  load_module+0x10c0/0x1638
> [  305.954012]  init_module_from_file+0xe0/0x140
> [  305.955058]  idempotent_init_module+0x2c0/0x590
> [  305.956174]  __arm64_sys_finit_module+0xb4/0x140
> [  305.957282]  invoke_syscall+0xd8/0x258
> [  305.958187]  el0_svc_common.constprop.0+0x16c/0x240
> [  305.959526]  do_el0_svc+0x48/0x68
> [  305.960456]  el0_svc+0x58/0x118
> [  305.961310]  el0t_64_sync_handler+0x120/0x130
> [  305.962510]  el0t_64_sync+0x194/0x198
> [  305.963509] irq event stamp: 37944
> [  305.964412] hardirqs last  enabled at (37943): [<ffffb02324a7439c>]
> console_unlock+0x1a4/0x1c8
> [  305.966602] hardirqs last disabled at (37944): [<ffffb023276724e4>]
> el1_dbg+0x24/0xa0
> [  305.968535] softirqs last  enabled at (37930): [<ffffb0232475114c>]
> __do_softirq+0x8e4/0xe1c
> [  305.970781] softirqs last disabled at (37925): [<ffffb0232475a9b0>]
> ____do_softirq+0x18/0x30
> [  305.972937] ---[ end trace 0000000000000000 ]---
>=20
> The 64K max_segment size of the device seems to be inherited by PCIs
> default.
> The sg list is crated via this drm helper:
>=20
> struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
>   				       struct page **pages, unsigned int
> nr_pages)
> {
> ...
>   	if (dev)
>   		max_segment =3D dma_max_mapping_size(dev->dev);
>   	if (max_segment =3D=3D 0)
>   		max_segment =3D UINT_MAX;
>   	err =3D sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
>   						nr_pages << PAGE_SHIFT,
>   						max_segment, GFP_KERNEL);
> ...
> }
>=20
> I'm a bit puzzled why this uses dma_max_mapping_size() and not
> dma_get_max_seg_size(). But since this is used by a lot of drivers
> I'm not really keen to touch this code that works like this for ages.
>=20
> So let's just make debug dma code aware of the actual segment size
> that's used by the device:
>=20
> --->8
> drm/virtio: set segment size for virtio_gpu device
>=20
> Set the segment size of the virtio_gpu device to the value
> used by the drm helpers when allocating sg lists to fix the
> following complaint from DMA_API debug code:
> DMA-API: virtio-pci 0000:07:00.0: mapping sg segment longer than device
> claims to support [len=3D262144] [max=3D65536]
>=20
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>    drivers/gpu/drm/virtio/virtgpu_drv.c | 1 +
>    1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c
> b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 4334c7608408..74b2cb3295af 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -94,6 +94,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
>    			goto err_free;
>    	}
>=20
> +	dma_set_max_seg_size(dev->dev, dma_max_mapping_size(dev-
> >dev) ? : UINT_MAX);
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>    	ret =3D virtio_gpu_init(vdev, dev);
>    	if (ret)
>    		goto err_free;
> --
> 2.43.0
>=20
>=20

