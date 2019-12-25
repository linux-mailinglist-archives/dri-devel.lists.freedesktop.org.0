Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB712A674
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 07:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458E489B0C;
	Wed, 25 Dec 2019 06:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770058.outbound.protection.outlook.com [40.107.77.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185A689B0C;
 Wed, 25 Dec 2019 06:45:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0xSp6YLXU7pskqd2HlbuHVQIH3JHHYTZ4BuGjoUH7gZ1IsW3bmEL6kPe51xgSop4je3/sjw+lPElgcw2Fq9+2AnYyUe3DdjUxyejCuAWP5930SkCjmJk5idqWeLzY89wzBLtLZUnNDLrpkF6tWTyBrx+x0S1PPAdUfsc/+Gmdxp+pgOTjb5LaQWVgmfJVXVpmweq8Jkw6klMLcWffVIs0S1yVGt2d8kqgReY6t4powoMfC0YvwPWYMBTdCE0Ltr8ss8fNGk6A/v0823Y0jFdT5v4IQ+CHyvQfbxLD9W7viRFq22/8WJm1V+H+bHeTp2zRBVnuZzqksxbZ2Fl/Ru9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVaW8cIhL1fnB43gCgm+xB5XJb/zwOBr+sWiauEHVsU=;
 b=j5wUVE22jhzW6/JNKScky6GT6OfyZJDcKl36RnKN6XGcklh/ap2EtULNtHVFJaWWVpS9fn1PiGpzRH2Ai8l70/RdZP8JCrvO2yJTxTy60se2VMB6BXlpvg8eNkXmck50GPInLJt2kIE79YFckFkMtOIfdre418o+QOA76xvebKWHw0p1uM8/SrgDANIHPvFCpAfmO6XXZdQIi7LWhS4vAfllgeK7KyCZ7y88q0OxbT8QKLfWLb3UUYQZti6RgRfwcW7+baVi/lqI0JcGIU5M0CpvpDuLjRSmVqCr1+VUKkLbMqMnHUsOYCywAozCCUBm5YQo4c44iFY0p6VsF3XIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVaW8cIhL1fnB43gCgm+xB5XJb/zwOBr+sWiauEHVsU=;
 b=r3ONp2ydtZ/H8c6nnso5pr44ZHevY1MvOAZWDBRPUCULBz9iXzq8JoOap1zm05Jt0xnwI29Q81vTvpUaiWUYVtlxr8L1H0lUzIlQO6KfCgIUhFrMWYEH9iZwzF18ml5vzNHcjQPMC+oUfr4XsZdVr+utmUfUUfSHFkz3O/3eA/Q=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3260.namprd12.prod.outlook.com (20.179.104.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Wed, 25 Dec 2019 06:45:36 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::f06d:7ff3:2a22:99d4]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::f06d:7ff3:2a22:99d4%3]) with mapi id 15.20.2559.017; Wed, 25 Dec 2019
 06:45:36 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/dp_mst: clear time slots for ports invalid
Thread-Topic: [PATCH] drm/dp_mst: clear time slots for ports invalid
Thread-Index: AQHVrBDEG2oqjDxKoU2lob1fSRqxeKfDzlcAgAaCSLA=
Date: Wed, 25 Dec 2019 06:45:36 +0000
Message-ID: <DM6PR12MB41378AEE89F13DA0825F2AD5FC280@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191206083937.9411-1-Wayne.Lin@amd.com>
 <589e939efca5209af318645fa6799c423897eea6.camel@redhat.com>
In-Reply-To: <589e939efca5209af318645fa6799c423897eea6.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d06e5be2-9279-4f6b-d733-08d789060c5d
x-ms-traffictypediagnostic: DM6PR12MB3260:|DM6PR12MB3260:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB32605F61CF613779A9A4B89FFC280@DM6PR12MB3260.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02622CEF0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(13464003)(54906003)(316002)(8936002)(8676002)(81156014)(81166006)(66476007)(33656002)(9686003)(7696005)(55016002)(71200400001)(110136005)(66946007)(66556008)(64756008)(66446008)(2906002)(186003)(53546011)(6506007)(966005)(76116006)(26005)(4326008)(45080400002)(86362001)(5660300002)(52536014)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3260;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ynqNjzEgLlmbjjKtliNO+fECQU+maoOlzFDQhI3LsV7r+s4ODVaDcGJy6D/irljtHvevzoxhjsinmi1qb3i6zMzwDxqrRWLh/RObDeFzCaEZoUbPDKlzZtQqrqmr4sZRfKjJop45Rlf+4Z8zXUbNHcXDeRczrOKcAyNDq/QCgPFdBf+mTIdIP78/wtz6lc2KuiKP4F3UI0/Zy4g5D6J+Tsr53AhgYSxutpSDX+DJP2AdEjZJH6Gl/C++46Bu2YCKJSdvK4OaEqCPZbzLHlsdCOamkG+l4Q6HY7ZMH78F+UTsovUffaneVolhDxcchvEf86q99zzjXmTTLQe0ME/gkR1JBq0x6S34uhfAe8+EDgmHXmOab8loXPqP3D/y2/HYcXfvJ2gzsnLqbUQAKZMjIbzyFdxmun4MkfKF8U4Th2JYXGIRuywROS00xzfp7C/awo3P71o2LB2CwfZNxeIP871dpNw9rXecPe2kNZlJFQqb5Ct7YydrVWHV0FSOFbch
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06e5be2-9279-4f6b-d733-08d789060c5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2019 06:45:36.4269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mr/4KxgyFggyYh2hj7AFnhKpzBhbFvqKc5WMjIMaeBlETPoykbqKHcDPr7vcUtvyAuOmKAwP8qkr1GJXg3X+xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3260
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Saturday, December 21, 2019 8:12 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org
> Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry
> <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>;
> stable@vger.kernel.org
> Subject: Re: [PATCH] drm/dp_mst: clear time slots for ports invalid
> 
> Mhh-I think I understand the problem you're trying to solve here but I think this
> solution might be a bit overkill. When I did the rework of topology references
> for ports, I made it so that we can guarantee memory access to a port without
> it needing to be a valid part of the topology. As well, all parents of the port are
> guaranteed to be accessible for as long as the child is. Take a look at:
> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2F01.org%
> 2Flinuxgraphics%2Fgfx-docs%2Fdrm%2Fgpu%2Fdrm-kms-helpers.html%23refco
> unt-relationships-in-a-topology&amp;data=02%7C01%7Cwayne.lin%40amd.co
> m%7C722655b546c049dc081908d785aa6758%7C3dd8961fe4884e608e11a82d
> 994e183d%7C0%7C0%7C637124839257213115&amp;sdata=Ctha3ja8kleeFOp
> PpA7EwDV1is81RAMsjqd1P6463ak%3D&amp;reserved=0
> 
> It's also worth noting that because of this there's a lot of
> get_port_validated()/put_port_validated() calls in the MST helpers that are
> now bogus and need to be removed once I get a chance. For new code we
> should limit the use of topology references to sections of code where we need
> a guarantee that resources on the port/branch (such as a drm connector, dp
> aux port, etc.) won't go away for as long as we need to use them.
> 
> Do you think we could change this patch so instead of removing it from the
> proposed payloads on the CONNECTION_STATUS_NOTIFY, we keep the port's
> memory allocation around until it's been removed from the proposed payloads
> table and clean it up there on the next payload update?
> 
Really appreciate for your time and comments in detail.

In this patch, I wanted to just set the proposed_vcpi->num_slots to 0 for those
ports which are no longer in the topology due to there is no need to allocate time
slots for these port. And expect those vcpi will be updated during next update of 
payload ID table by drm_dp_update_payload_part1(). 

I tried to use drm_dp_mst_topology_get_port_validated() as a helper to 
decide whether a port is in the topology or not. Use this function to iterate over
all ports that all proposed_vcpi[] drive to. If one port is not in the topology, set the
num_slots of the proposed_vcpi for this port to 0. With num_slots as 0, these 
proposed_vcpi will be clean up in next payload table update by 
drm_dp_update_payload_part1(). If a port is still in the topology, then release
the reference count which was acquired previously from
drm_dp_mst_topology_get_port_validated() and do nothing.

I didn't mean to kill invalid ports on receiving CONNECTION_STATUS_NOTIFY.
Sorry if I misuse or misunderstand something here?

> On Fri, 2019-12-06 at 16:39 +0800, Wayne Lin wrote:
> > [Why]
> > When change the connection status in a MST topology, mst device which
> > detect the event will send out CONNECTION_STATUS_NOTIFY messgae.
> >
> > e.g. src-mst-mst-sst => src-mst (unplug) mst-sst
> >
> > Currently, under the above case of unplugging device, ports which have
> > been allocated payloads and are no longer in the topology still occupy
> > time slots and recorded in proposed_vcpi[] of topology manager.
> >
> > If we don't clean up the proposed_vcpi[], when code flow goes to try
> > to update payload table by calling drm_dp_update_payload_part1(), we
> > will fail at checking port validation due to there are ports with
> > proposed time slots but no longer in the mst topology. As the result
> > of that, we will also stop updating the DPCD payload table of down stream
> port.
> >
> > [How]
> > While handling the CONNECTION_STATUS_NOTIFY message, add a detection
> > to see if the event indicates that a device is unplugged to an output port.
> > If the detection is true, then iterrate over all proposed_vcpi[] to
> > see whether a port of the proposed_vcpi[] is still in the topology or
> > not. If the port is invalid, set its num_slots to 0.
> >
> > Thereafter, when try to update payload table by calling
> > drm_dp_update_payload_part1(), we can successfully update the DPCD
> > payload table of down stream port and clear the proposed_vcpi[] to NULL.
> >
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 24
> +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 5306c47dc820..2e236b6275c4 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -2318,7 +2318,7 @@ drm_dp_mst_handle_conn_stat(struct
> > drm_dp_mst_branch *mstb,  {
> >  	struct drm_dp_mst_topology_mgr *mgr = mstb->mgr;
> >  	struct drm_dp_mst_port *port;
> > -	int old_ddps, ret;
> > +	int old_ddps, old_input, ret, i;
> >  	u8 new_pdt;
> >  	bool dowork = false, create_connector = false;
> >
> > @@ -2349,6 +2349,7 @@ drm_dp_mst_handle_conn_stat(struct
> > drm_dp_mst_branch *mstb,
> >  	}
> >
> >  	old_ddps = port->ddps;
> > +	old_input = port->input;
> >  	port->input = conn_stat->input_port;
> >  	port->mcs = conn_stat->message_capability_status;
> >  	port->ldps = conn_stat->legacy_device_plug_status;
> > @@ -2373,6 +2374,27 @@ drm_dp_mst_handle_conn_stat(struct
> > drm_dp_mst_branch *mstb,
> >  		dowork = false;
> >  	}
> >
> > +	if (!old_input && old_ddps != port->ddps && !port->ddps) {
> > +		for (i = 0; i < mgr->max_payloads; i++) {
> > +			struct drm_dp_vcpi *vcpi = mgr->proposed_vcpis[i];
> > +			struct drm_dp_mst_port *port_validated;
> > +
> > +			if (vcpi) {
> > +				port_validated =
> > +					container_of(vcpi, struct
> > drm_dp_mst_port, vcpi);
> > +				port_validated =
> > +					drm_dp_mst_topology_get_port_validated
> > (mgr, port_validated);
> > +				if (!port_validated) {
> > +					mutex_lock(&mgr->payload_lock);
> > +					vcpi->num_slots = 0;
> > +					mutex_unlock(&mgr->payload_lock);
> > +				} else {
> > +					drm_dp_mst_topology_put_port(port_vali
> > dated);
> > +				}
> > +			}
> > +		}
> > +	}
> > +
> >  	if (port->connector)
> >  		drm_modeset_unlock(&mgr->base.lock);
> >  	else if (create_connector)
> --
> Cheers,
> 	Lyude Paul
--
Best regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
