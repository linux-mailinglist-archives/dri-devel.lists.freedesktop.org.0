Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874202BFE24
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 03:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC2A89AA7;
	Mon, 23 Nov 2020 02:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFF089AA7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 02:23:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlzsQxdBGl8GWTegj9Rr81/v2dfopTYnsbVRdawIJPok76KBneXPG2hmP3O4Cgbdv5tPcHoIpKBeNmJlRd6qL/WM7oeAug9ihnuw8ARYnHLCz4v6rT345e+D5PCPJjYiYv5EdqJQs1WkQEl3gpvxQmsIZCaT6wGn+dNk8AIPquQJHWmfv5WZfA1PDlhT7Bkl9q3BmwEl6/RyxhDry60KZ7vuf60JSHgHBWZyxPx2lyzu+2gBWYbts6R32+WFu+6zPEc0p8vjJkVGuNGgESyEcdnfx3HU/yS6luRq6LD37JDpXGfSzvTVthDjcrC+4GLDYB6kYyxft4uJGPXWHI0PPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5tVZxgxS/rgwcuRs003loEm/Jf3J5M6PXqZEl+kJHs=;
 b=Biuraa525vOk7pYOS4Eq3vQWN7QtQy4wwYfK4mAI/dVj6ZB+e9j9fkG9MWvxAKJTvkdATTR4exwO2sl2E+Vmfh77mblyg1m25cgCay4044ZAUQTV2ufS3vyGZDwTM13rcCoJDYmdQYTQm7Qe+pmWrScK9OksmJYIedq9BdoT4gaki4CJUaLE+kb5vM8y6DWXO3ApQlAKmVj3maH4natNELVP27X18i9RIl8K/kZ38pBe34DUuFcBbQZ2JPiE1Btdh0xcVpqsI1IknPhU/LybAIrs0w5aTAKpUhEZG8llIzO6fySncJEzCq+nww5aK38l6bUWqwlAxuq0S0VgpdPG9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5tVZxgxS/rgwcuRs003loEm/Jf3J5M6PXqZEl+kJHs=;
 b=vJfa3OD0fbgid0HyPkBgovY+Od+mPh0tmTCewS4RPtctWR9HYMS6isPncegKQMKCO+rhpnkrQfX3/dSSrsiXL2K4zZSqiATR9pan/NUrMRUNuCOwror8xZwAMcHzcSDpK4oT0H7yeDIlNwXL030q2oRZcRzBbFG1aCsm/zWt7Do=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1912.namprd12.prod.outlook.com (2603:10b6:903:11c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Mon, 23 Nov
 2020 02:23:00 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::ad96:acee:5c1c:d92c]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::ad96:acee:5c1c:d92c%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 02:23:00 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: kernel test robot <lkp@intel.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [radeon-alex:amd-20.45 2387/2417]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1284:2: warning: ignoring return
 value of function declared with 'warn_unused_result' attribute
Thread-Topic: [radeon-alex:amd-20.45 2387/2417]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1284:2: warning: ignoring return
 value of function declared with 'warn_unused_result' attribute
Thread-Index: AQHWv8ySarkcVobqskGBncYjbn+o1qnU/wsQ
Date: Mon, 23 Nov 2020 02:23:00 +0000
Message-ID: <CY4PR12MB12879F5FFCC7C7D8D7D99617F1FC0@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <202011211424.DlcgbXMe-lkp@intel.com>
In-Reply-To: <202011211424.DlcgbXMe-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-11-23T02:22:53Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=b273ef5d-eb37-4fd9-9969-000034c741f4;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-11-23T02:22:58Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 51c97351-08e5-4fe9-bb72-0000d6460020
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.158.166.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 495be33d-e78f-4814-e684-08d88f56b303
x-ms-traffictypediagnostic: CY4PR12MB1912:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB19124D6F49B8BEAEB64C83CDF1FC0@CY4PR12MB1912.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:48;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HeJBW+C/w8n3WTG/EuIdxIdX7BNiE/qKkW+OIz4z6ofUadkZxgOJhV3y3fmda+exacuI0XCnfNg7U0RYiuVBr1MNb3UeQB03T+JhcXR/AF9oFj44afpb2obla5zmMvDmvVxxcZvfl3fVT6/9d33U9h0mmb4Vax3mMniASo20lnBbCvPz6PUz65/m5VcQAJG1qUZHqqRl22rkjcxw711Yc0ehLEeGR/aVEU/pziXqddbIgiPP5URSPpGS1L04neYvyy2gFOrIMwKcxd6u6X9wDWeD57BKmX28Y4pqO6Dxgzu0oj2QHdR+oQJ+5T2UFtGxb8TJ2s1MrZV+J4qLiC+yT4Wb7SlbRovt69bfjQh5UarZi0brJdeZx1QWaKZUW3FYCm+8hoCzfd1J8TnItwgxZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(6506007)(966005)(316002)(83380400001)(86362001)(53546011)(45080400002)(26005)(186003)(7696005)(9686003)(110136005)(54906003)(478600001)(55016002)(33656002)(76116006)(71200400001)(2906002)(5660300002)(66476007)(4326008)(66556008)(66446008)(66946007)(64756008)(52536014)(8676002)(6636002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nIM3ubzl1cDPrJdIIX6kGt68LhigjNm72vrjsf8nVZbs0bvEAhBR5V99q8iytbegPlL0fXihP+5+tyINSUaGGYl/GOn8CktOzMixGpxLTNhX+Soojx/uqwZ1EdVvWOiCIUOZTbu8RG1ww4wBiafXI/LHRbQAA3nA2seNJqHEC4usatZEJ3PfpFqcoeU371y/KAaYC87O85uGWo7tabtyZE9gzGkAdNItsoy0D7D+vidi/yEr34TbQ4/mg4u5bFoIM0cZNPK3nLZk4h8qM7+7Q9H0q7KL+1bDBiTHwRWMZjJS9M02Uja/n3MuRcfn9H1eRJVkKQF//WDLhRk4Sgy+zYzznKW82Fx82j6Kb6cPkPWaOUNJhHJry5wBO1CwgmxtKavYXt2LltjWngowa1E5bd9lpNfgTkN6sDXJzz78lZlO3jnxWq78KZ2hdWXCwID9+bXcjgoc4jkKRxacyiewfH4+QMAkpwGy6vUflBbnKFDHEB2XvmuQI9a77/R6DZTCXX5VT3qB1gwXZPbDl7IBX28E4x2DmmV0ahJYGKhK3nUMEkuSX3FJ5mEsmaNFawvVpNMz1LBnCbrfgst4D1OXeGdek6kYe5DbleP/RaqdFKmO2nD3lZnZ+uosvqmHK4P8m6C8vRoARsaEDneb6HTlrbQVSGDnajFq4eGvZUETbmOk3v3RgUHV4l8P/StZ6fLLKea7NtFqMwe1vcpyF69xLR3olSQxpbx4DlE560PznHgVkgjUhMn8nvAKFdgOSyjXt9133HTVQfzeZ6p0m/XrK02ICbshRGhGosUYy8h++qZyxIkkjzwvKp33BS9yjjVubNZclpNnFoTMEnOnAi2n0Gjxr4uJpkN1vFJ+ehbFgs4S+ZwJRvr8FD3nA95IL9PFjVeRylwB+FIYHf+Kep7utQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495be33d-e78f-4814-e684-08d88f56b303
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 02:23:00.5482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xro56NjoXGvBDfcfxIvKaJHuynNK+vQr6Wz0qYKtXo248tBtjdHFC/lnJu+pzTNLwMG9LRZBFuFnVQk/BpFZYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1912
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

+Alex.

We have one following patch to fix this. Please check.

a069a9eb73f8 drm/amdgpu: fix a warning in amdgpu_ras.c (v2)

Regards,
Guchun

-----Original Message-----
From: kernel test robot <lkp@intel.com> 
Sent: Saturday, November 21, 2020 2:02 PM
To: Chen, Guchun <Guchun.Chen@amd.com>
Cc: kbuild-all@lists.01.org; clang-built-linux@googlegroups.com; dri-devel@lists.freedesktop.org; Li, Dennis <Dennis.Li@amd.com>
Subject: [radeon-alex:amd-20.45 2387/2417] drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1284:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-20.45
head:   1807abbb3a7f17fc931a15d7fd4365ea148c6bb1
commit: cf13e50dea28cde351fa32767e36135afb30386d [2387/2417] drm/amdgpu: clean up ras sysfs creation (v2)
config: x86_64-randconfig-a011-20201120 (attached as .config)
compiler: clang version 12.0.0 (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C5d30079af0d54041642608d88de31a49%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637415356400664955%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=aEjIu7Q%2FtIwvVsp%2BV28FUwW74QJCsFQ7g3Qak6%2FrazU%3D&amp;reserved=0 3ded927cf80ac519f9f9c4664fef08787f7c537d)
reproduce (this is a W=1 build):
        wget https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C5d30079af0d54041642608d88de31a49%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637415356400664955%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=NphWy5Ztnf61zx9D%2FBrH%2FP64Yr5tecsLo2FecWTQNpE%3D&amp;reserved=0 -O ~/bin/make.cross
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
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C5d30079af0d54041642608d88de31a49%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637415356400664955%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=t65EPRNLSzRefqgSIvcqTFVYdVk6RuVZxAd2vcC9ybI%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
