Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE5143847
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 09:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E06F6EBE0;
	Tue, 21 Jan 2020 08:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AF46EAAB;
 Mon, 20 Jan 2020 17:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mt6TqnVWsRX++sejRh/VDKAAIcGrOmP2B4gaURoVsOQ=; b=BeAXOL/BB+EmRC8E0SsyK5kRT
 PHQ0dANrneerNVn2tD8GKlr2QPjxSpXAAMvLhtvklSDM1J55LPtRfHtgDX5KFjFs1SiIxNjdkIbUD
 qnSzHZsLT8FLF5Ha91Q3LneE06ZNHDGvyb+C6eI/dgx6VeCcP0LuK0cy1j0ZmKhmzX76MkydVL4fl
 zqg+4Nq01AlO1gc2UQ5qT39ZmEEDa0D8Xs2FkZzJhBf+1f7YANXIjYKIQot+Jw6UyYw9iVsq+m3s/
 YEC2EHsCzIQL2eYMYUfO3ReuBOmOoVehlWGf30ryqQPqJZ9LZRVsnGl5elHk6Ydjj0kAdYSmFBhEf
 LzWAdXXFQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1itaqI-0007KO-O3; Mon, 20 Jan 2020 18:28:02 +0100
Received: from [2001:16b8:5700:3700:f1da:99e3:e2a2:9568] (helo=linux.fritz.box)
 by sslproxy06.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1itaqI-000IsV-DH; Mon, 20 Jan 2020 18:28:02 +0100
Message-ID: <ea0d2226a66efedcfc406f574453a374df1bb338.camel@cyberus-technology.de>
Subject: Re: [RFC PATCH 1/4] drm/i915/gvt: make gvt oblivious of kvmgt data
 structures
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Mon, 20 Jan 2020 18:28:01 +0100
In-Reply-To: <20200120063318.GC14597@zhen-hp.sh.intel.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-2-julian.stecklina@cyberus-technology.de>
 <20200120062210.GA14597@zhen-hp.sh.intel.com>
 <20200120063318.GC14597@zhen-hp.sh.intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25701/Mon Jan 20 12:41:43 2020)
X-Mailman-Approved-At: Tue, 21 Jan 2020 08:32:00 +0000
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
Cc: zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hang.yuan@intel.com
Content-Type: multipart/mixed; boundary="===============0201514311=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0201514311==
Content-Type: multipart/alternative; boundary="=-2itBrIMBf6UwAINAAGa4"


--=-2itBrIMBf6UwAINAAGa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-20 at 14:33 +0800, Zhenyu Wang wrote:
> hmm, I failed to apply this one, could you refresh against gvt-staging branch
> 
> on https://github.com/intel/gvt-linux?

Done. I've sent out the rebased (and re-tested) patch.

Julian

--=-2itBrIMBf6UwAINAAGa4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align: left; direction: =
ltr; word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-whi=
te-space;"><div>On Mon, 2020-01-20 at 14:33 +0800, Zhenyu Wang wrote:</div>=
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid;padding-left:1ex">hmm, I failed to apply this one, could you refre=
sh against gvt-staging branch<br>
on <a href=3D"https://github.com/intel/gvt-linux">https://github.com/intel/=
gvt-linux</a>?</blockquote><div><br></div><div>Done. I've sent out the reba=
sed (and re-tested) patch.</div><div><br></div><div>Julian</div></body></ht=
ml>

--=-2itBrIMBf6UwAINAAGa4--


--===============0201514311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0201514311==--

