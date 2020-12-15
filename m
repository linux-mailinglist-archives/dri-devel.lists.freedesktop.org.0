Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67052DA80E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 07:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F126E14F;
	Tue, 15 Dec 2020 06:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE736E14F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 06:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViwcHr6hXj3zwM/JKbIRQ0Vf4DcBG02rHmOR5wnDkw3Xmj8bvmPGcGCbY3Gqr/Fh67wIHfaFIZ7sjTOLw+G36h2qGTLjnG7SXttLU4alMq8kUpd1j8P69x3RjrF/Vkdo5sLLVVg8edtpm06gfCO3M0/3DU0vMHQAoXccyICY7UGYAsD2MQiI+ljL0zs+2CDwQgCsNIvFBRB9O1dHI5+uzzwMkVgzJy5DLBshQi90TXOgRGV1HyxE9c2WGMtbV4I6F/WLyY6uXi7a8k51NsZ1K4rnMkH2KTp80LX/J0/DC+c097O/VT3Fs3fVihVmWHkfxnpDdcfbiJiYbYLWpP9mLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ahUzLA/WilhBR7/KPFv1D+2atPe3azD1liCciKR3bI=;
 b=EQIo8Xi+MmEEOGYVEeu39mLMlddERQ9En/xAOpRpO+PSYWs2WOs1T64x71g+pybzE/DYVZH0LM+XLn6wWGeV026A+/5zE2oIrCEbjERs8N5gOFC03UkRpkFEuM6+/G0no3w2MOinT5XZq77MfX46HyTmTu6ZlJoEWYLCCiVSYjdFV/c0iQXSFhQU7v2wS9kgvM7wMtq2hDzOXJV8kQlgN1X8alkkEYH8is86WYXvfI48zNKM7FYFN3baW2RdXxajKVuxYbXKe/RysrsdmWYfO7Vw4d/BVAg15VxfUz5ZA7hvK2zGe2F7Q2hCgpoXu2rlt5uvt8/qLSP0C38FNT3Q5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ahUzLA/WilhBR7/KPFv1D+2atPe3azD1liCciKR3bI=;
 b=4Vd5Oqo0gWOovlF/h0PMOQss7LpwuAwL5MxJJApxFRUkJsBCDx548lWrDWi69HjfV/n6x8h/XwJGh+V5wYGMP4Rodf3MZTCUghWn7XY0/sD+mCB8C8DBNhB407wX3K+HAuZi6o9zyMUs55i8/JF6F347MRFS2w5TloeAp3yNQtY=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1271.namprd12.prod.outlook.com (2603:10b6:903:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Tue, 15 Dec
 2020 06:18:13 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::bc0f:dd2:ef80:de2]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::bc0f:dd2:ef80:de2%12]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 06:18:12 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: kernel test robot <lkp@intel.com>
Subject: RE: [radeon-alex:amd-20.45 2387/2427]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1284:2: warning: ignoring return
 value of function declared with 'warn_unused_result' attribute
Thread-Topic: [radeon-alex:amd-20.45 2387/2427]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1284:2: warning: ignoring return
 value of function declared with 'warn_unused_result' attribute
Thread-Index: AQHW0qaaZoAY9mqweE+xuIx/bUFrHKn3rmPw
Date: Tue, 15 Dec 2020 06:18:12 +0000
Message-ID: <CY4PR12MB1287C444F22CD45E70061C52F1C60@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <202012151335.lqRKtqi9-lkp@intel.com>
In-Reply-To: <202012151335.lqRKtqi9-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-12-15T06:16:43Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=a06892ec-c0f1-4bb8-9455-00002763d06f;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-12-15T06:18:10Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: e8526564-1a74-42a5-ba1d-0000a1ef4ab0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
dlp-product: dlpe-windows
dlp-version: 11.5.0.60
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 52a54d49-2915-4db7-6c38-08d8a0c13398
x-ms-traffictypediagnostic: CY4PR12MB1271:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1271226EFAE03AD115E08226F1C60@CY4PR12MB1271.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:82;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sWC41EqM6HsGv0rJE87bhh2oDqpXXIG6I6qUwzhhkbOtpc2wUilrb4k0xe2IsVEvvP9014QFTb0w+U8evk5s1bZ7zS+P+CNU7B+g/AH2mvBkS0Q1UZslgFtIUAxxT1lAeortm+ud0bYZwAdtGr9gDskk6+W4blNYxrSCbflCWMT0Vxgoq8Tgb2dAjgbKq3nxtil/S+rh8LXj4nqdyyi0gAH13/ILMmB025p59Uy5haLQ8AGO5ngP+rH5uRuC4fAOSXUWUp5ElIEB/BI7P7H+jhrZkPSdE/laD+LxXI41nx/AQEov+qoF+F27a1mQhm/UfEOeekRcge9PkhsqcflslpOF80F+jIhsextZatHnJwCiC0e/iZbe+/2HsnVHXOQGbshVIyVr7Fsy7m7mLY3sAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(6916009)(71200400001)(66946007)(5660300002)(52536014)(53546011)(54906003)(2906002)(4326008)(26005)(6506007)(7696005)(83380400001)(66446008)(966005)(86362001)(8936002)(508600001)(66556008)(186003)(9686003)(45080400002)(55016002)(8676002)(64756008)(33656002)(76116006)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?k06YkTq18vYmsJP70KfjfJ3G3DbnTeU89RFn+9KUxCApWxrNpbM8WkzHI8zI?=
 =?us-ascii?Q?eJlM10NluGA7Ui8Pe2JaTNNWLvzJrZSmJx3wGfcOlG0dJB2k4MfBNJcMOyfX?=
 =?us-ascii?Q?Rr16cYnT7YBBQdqqfyt9zmuQKVvChj+2BvhjH1Q1WTB0owtUwtZyq7lfYSWW?=
 =?us-ascii?Q?xv6Pb2InzR80Jh7+hVqpw6Q5Yylh0rgqj7ApkLwcCPm9ASfm460iq9NrkCdP?=
 =?us-ascii?Q?EFdT8Y+1tBb5xTKrshapNuAjceT2xGLBSGtUDY2Zh1urfq/Fh6H5H/soDa2a?=
 =?us-ascii?Q?SQvnwHsE6dQ1UIYdBBG/nEFZ29Hkl6IBIjT5qer4FKt2oALF/usjJHaM9ujy?=
 =?us-ascii?Q?PPVOtU2zeh55nEBfO2ynvowg+nVYPTb7WzSO6K5rvDAYFyxvjumjJ/ck0Sd0?=
 =?us-ascii?Q?RpTW20IKS9L3GSC6bFsPDhPpS9qmCtgSjR+BZHt4Re5Y8CLDg/sj+uZYGsx+?=
 =?us-ascii?Q?e70HVzF5KoIAQO3YGfpDDt3QmwbOfD58AqMjZYDjAAWcopxtqTiXe8e43c3c?=
 =?us-ascii?Q?niVhFJuWM4MtRvESZmyQR7wOI3L6ETxEHBc/sfSQ634sJLnpBTZ+kvOh02LX?=
 =?us-ascii?Q?PJEQr3SmoywfmA/5ek5bPuCLqdXGHwHquZ0l53NT1pRwKsKbftQNQIlitz1e?=
 =?us-ascii?Q?JCygajwcvjooGus/UXkn5Haf1DyWqWiJK9w3V1ojgbcV+PWFtOmK275KsVhx?=
 =?us-ascii?Q?nd9mr7sV2rLObp7FQyK1mQYUByJs4/LnlEs+qnUF2Czr5fGTJS/OaQ6Fmb8h?=
 =?us-ascii?Q?HfTCIZMJM3Tls2AGXjHI1SmjV0WoctzHM1RAkxq1MzeCNj/cCHoXMpjjoMwg?=
 =?us-ascii?Q?89iTpNOcTrbaKx/UU1bkzJlc8f6Rxuf0oXPiIBDYyJwZNrPU38mv728Hkl05?=
 =?us-ascii?Q?BJhgJXjgeii0tPAni0IdjAVr/199zz4RMV77vRuzVEC7eYItxSfPZzOUcu3s?=
 =?us-ascii?Q?z0SWJxbmyaYbCDV8elxd73l1qTq04s6jdXbWLB8fNVbmyKOfGDXcOOv08/iu?=
 =?us-ascii?Q?3cS3?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a54d49-2915-4db7-6c38-08d8a0c13398
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 06:18:12.6265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxPpOJlYAtpK7X7JV2cqqsNzJJZc4PoyUuzFq6qJeF7/IwRAdAzks7XoaqWn5gaoj+N+7sA4EEeQOC5SDOnhvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1271
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
Cc: "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, "Li, 
 Dennis" <Dennis.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Hi there,

I will fix this soon. The issue is reported on amd-20.45 branch, which was branched out ahead of the fix available on mainline.

Regards,
Guchun

-----Original Message-----
From: kernel test robot <lkp@intel.com> 
Sent: Tuesday, December 15, 2020 1:49 PM
To: Chen, Guchun <Guchun.Chen@amd.com>
Cc: kbuild-all@lists.01.org; clang-built-linux@googlegroups.com; dri-devel@lists.freedesktop.org; Li, Dennis <Dennis.Li@amd.com>
Subject: [radeon-alex:amd-20.45 2387/2427] drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1284:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute

Hi Guchun,

FYI, the error/warning still remains.

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-20.45
head:   a3950d94b046fb206e58fd3ec717f071c0203ba3
commit: cf13e50dea28cde351fa32767e36135afb30386d [2387/2427] drm/amdgpu: clean up ras sysfs creation (v2)
config: x86_64-randconfig-a002-20201214 (attached as .config)
compiler: clang version 12.0.0 (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C708cce12ecaa4d2ee1d108d8a0bd3135%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436084052882308%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=I4ohtcRRR8iQs%2FfkMhy%2B7pnsAJ4V%2Br%2F0EpNjcoQp%2B4s%3D&amp;reserved=0 a29ecca7819a6ed4250d3689b12b1f664bb790d7)
reproduce (this is a W=1 build):
        wget https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C708cce12ecaa4d2ee1d108d8a0bd3135%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436084052892302%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ijbznpvhsb43YLeQJ6UZb%2BfG4mnCiAA2ZmPQhLgz6Ig%3D&amp;reserved=0 -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
        git fetch --no-tags radeon-alex amd-20.45
        git checkout cf13e50dea28cde351fa32767e36135afb30386d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:906:5: warning: no previous prototype for function 'amdgpu_ras_error_cure' [-Wmissing-prototypes]
   int amdgpu_ras_error_cure(struct amdgpu_device *adev,
       ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:906:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int amdgpu_ras_error_cure(struct amdgpu_device *adev,
   ^
   static 
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1284:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           sysfs_create_group(&adev->dev->kobj, &group);
           ^~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.

vim +/warn_unused_result +1284 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

  1249	
  1250	/* ras fs */
  1251	static BIN_ATTR(gpu_vram_bad_pages, S_IRUGO,
  1252			amdgpu_ras_sysfs_badpages_read, NULL, 0);
  1253	static DEVICE_ATTR(features, S_IRUGO,
  1254			amdgpu_ras_sysfs_features_read, NULL);
  1255	static int amdgpu_ras_fs_init(struct amdgpu_device *adev)
  1256	{
  1257		struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
  1258		struct attribute_group group = {
  1259			.name = RAS_FS_NAME,
  1260		};
  1261		struct attribute *attrs[] = {
  1262			&con->features_attr.attr,
  1263			NULL
  1264		};
  1265		struct bin_attribute *bin_attrs[] = {
  1266			NULL,
  1267			NULL,
  1268		};
  1269	
  1270		/* add features entry */
  1271		con->features_attr = dev_attr_features;
  1272		group.attrs = attrs;
  1273		sysfs_attr_init(attrs[0]);
  1274	
  1275		if (amdgpu_bad_page_threshold != 0) {
  1276			/* add bad_page_features entry */
  1277			bin_attr_gpu_vram_bad_pages.private = NULL;
  1278			con->badpages_attr = bin_attr_gpu_vram_bad_pages;
  1279			bin_attrs[0] = &con->badpages_attr;
  1280			group.bin_attrs = bin_attrs;
  1281			sysfs_bin_attr_init(bin_attrs[0]);
  1282		}
  1283	
> 1284		sysfs_create_group(&adev->dev->kobj, &group);
  1285	
  1286		return 0;
  1287	}
  1288	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C708cce12ecaa4d2ee1d108d8a0bd3135%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637436084052892302%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3yLWtrUMlcPIY%2BMPElzz0R3JmvxV94d6yb0qKIZgdZM%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
