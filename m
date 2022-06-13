Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9520B54AA99
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7282810FA39;
	Tue, 14 Jun 2022 07:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 14322 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jun 2022 19:38:51 UTC
Received: from ma1-aaemail-dr-lapp02.apple.com
 (ma1-aaemail-dr-lapp02.apple.com [17.171.2.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8295B10E021;
 Mon, 13 Jun 2022 19:38:51 +0000 (UTC)
Received: from pps.filterd (ma1-aaemail-dr-lapp02.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp02.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 25DFe2Xg036943; Mon, 13 Jun 2022 08:40:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=20180706; bh=EjqDJoxzE0WaVjRkhtdosSRLystxHsSyMvTwWpocqco=;
 b=eMQDfWsMPRBuUnAve3lkT2ADp2UtjujJMZfC3uskJgx16WBDUhoghCnr340yTBycA877
 GumfOOB1LP5nxXbiv9TXGXJGHDZtmGvVIAUo+aWj/KwR53Doorg08dq7k8nIoFuSwxgL
 Fw6GiIowzHj20S5SnGoME3eHJ1uM+gaVzyQzFpLNrBKMuhkxN7JD3zSGptwC2SLAnuIn
 IuklvmgyUMdtQoGbDifA+hQyJWuLsFjgX5EyU2qlhPt2Vu3x8nCMd34xU3MmldoAWWjz
 SsGpsU9VFkKdRHIsnsxor2zY/DBjBCvAL6VYKEexYsBY1NuMM2t4ZSOQxkKHNmFtBd81 lw== 
Received: from rn-mailsvcp-mta-lapp02.rno.apple.com
 (rn-mailsvcp-mta-lapp02.rno.apple.com [10.225.203.150])
 by ma1-aaemail-dr-lapp02.apple.com with ESMTP id 3gmqqt6n4y-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 13 Jun 2022 08:40:06 -0700
Received: from rn-mailsvcp-relay-lapp02.rno.apple.com
 (rn-mailsvcp-relay-lapp02.rno.apple.com [17.179.253.11])
 by rn-mailsvcp-mta-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.18.20220407 64bit (built Apr 7
 2022)) with ESMTPS id <0RDF0023MA6TNAL0@rn-mailsvcp-mta-lapp02.rno.apple.com>; 
 Mon, 13 Jun 2022 08:40:05 -0700 (PDT)
Received: from process_milters-daemon.rn-mailsvcp-relay-lapp02.rno.apple.com by
 rn-mailsvcp-relay-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.18.20220407 64bit (built Apr 7
 2022)) id <0RDF00100A6QTS00@rn-mailsvcp-relay-lapp02.rno.apple.com>; Mon,
 13 Jun 2022 08:40:05 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 23e3c620fd7a9ec1c6d967346d5e0ca4
X-Va-E-CD: 0aebfc6b920f22cb597609389786abf9
X-Va-R-CD: 24c0121e3315516d31a39b671e5eb902
X-Va-CD: 0
X-Va-ID: 2e9ccf6e-60b2-4268-94b1-ad7fe7a89d07
X-V-A: 
X-V-T-CD: 23e3c620fd7a9ec1c6d967346d5e0ca4
X-V-E-CD: 0aebfc6b920f22cb597609389786abf9
X-V-R-CD: 24c0121e3315516d31a39b671e5eb902
X-V-CD: 0
X-V-ID: 56ef8478-d584-42f9-850b-6c87de1dec54
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_07:2022-06-13,
 2022-06-13 signatures=0
Received: from smtpclient.apple (unknown [17.235.40.101])
 by rn-mailsvcp-relay-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.18.20220407 64bit (built Apr 7
 2022))
 with ESMTPS id <0RDF0017SA6SQ100@rn-mailsvcp-relay-lapp02.rno.apple.com>; Mon,
 13 Jun 2022 08:40:04 -0700 (PDT)
From: Jeremy Sequoia <jeremyhu@apple.com>
Message-id: <6200ADF0-737E-435D-964A-F6781A70319C@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_76E68A1A-EC85-4C9C-B13B-D3BDBEB40CD4"
MIME-version: 1.0 (Mac OS X Mail 16.0 \(3696.120.11\))
Subject: Re: 504 to gitlab.freedesktop.org
Date: Mon, 13 Jun 2022 08:40:04 -0700
In-reply-to: <CAPj87rPvEFCWeeohiczUCXGEdrwqwJza+CcrOy1E3d9UBHSnBA@mail.gmail.com>
To: Daniel Stone <daniel@fooishbar.org>
References: <304E860A-A638-45D1-9AF3-F121A31CF7B0@apple.com>
 <Yqa6aWa70/GqhAHO@quokka>
 <CAPj87rPHKmFq2-VTWEJH_iVe2R7xvmb44v_ZWcQ9VakhF+5ArA@mail.gmail.com>
 <CAPj87rPvEFCWeeohiczUCXGEdrwqwJza+CcrOy1E3d9UBHSnBA@mail.gmail.com>
X-Mailer: Apple Mail (2.3696.120.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_07:2022-06-13,
 2022-06-13 signatures=0
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:29:54 +0000
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
Cc: xorg-devel@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Peter Hutterer <peter.hutterer@who-t.net>, sitewranglers@lists.freedesktop.org,
 freedesktop@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_76E68A1A-EC85-4C9C-B13B-D3BDBEB40CD4
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Awesome, thanks!

> On Jun 13, 2022, at 07:30, Daniel Stone <daniel@fooishbar.org> wrote:
> 
> Hi,
> 
> On Mon, 13 Jun 2022 at 08:39, Daniel Stone <daniel@fooishbar.org> wrote:
>> Yes, that's what's happening. Our (multi-host-replicated etc) Ceph
>> storage setup has entered a degraded mode due to the loss of a couple
>> of disks - no data has been lost but the cluster is currently unhappy.
>> We're walking through fixing this, but have bumped into some other
>> issues since, including a newly-flaky network setup, and changes since
>> we last provisioned a new storage host.
>> 
>> We're working through them one by one and will have the service back
>> up with all our data intact - hopefully in a matter of hours but we
>> have no firm ETA right now.
> 
> Thanks mainly to Ben, everything is back up and running now.
> 
> Cheers,
> Daniel
> 


--Apple-Mail=_76E68A1A-EC85-4C9C-B13B-D3BDBEB40CD4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Awesome, thanks!<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Jun 13, 2022, at 07:30, =
Daniel Stone &lt;<a href=3D"mailto:daniel@fooishbar.org" =
class=3D"">daniel@fooishbar.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi,<br=
 class=3D""><br class=3D"">On Mon, 13 Jun 2022 at 08:39, Daniel Stone =
&lt;<a href=3D"mailto:daniel@fooishbar.org" =
class=3D"">daniel@fooishbar.org</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Yes, that's what's happening. Our =
(multi-host-replicated etc) Ceph<br class=3D"">storage setup has entered =
a degraded mode due to the loss of a couple<br class=3D"">of disks - no =
data has been lost but the cluster is currently unhappy.<br =
class=3D"">We're walking through fixing this, but have bumped into some =
other<br class=3D"">issues since, including a newly-flaky network setup, =
and changes since<br class=3D"">we last provisioned a new storage =
host.<br class=3D""><br class=3D"">We're working through them one by one =
and will have the service back<br class=3D"">up with all our data intact =
- hopefully in a matter of hours but we<br class=3D"">have no firm ETA =
right now.<br class=3D""></blockquote><br class=3D"">Thanks mainly to =
Ben, everything is back up and running now.<br class=3D""><br =
class=3D"">Cheers,<br class=3D"">Daniel<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_76E68A1A-EC85-4C9C-B13B-D3BDBEB40CD4--
