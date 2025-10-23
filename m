Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57712C01E81
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9FB10E063;
	Thu, 23 Oct 2025 14:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eWVVZTVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048CB10E063
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761231181;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2ORFISaeiHLKerQcTq685UgiWhPk9M/W0Or4n5bYbZw=;
 b=eWVVZTVq6BReGtK9CQ7byladI76RSZk59zHDtAF0HianI9o7yLva+rrapJZ3xvQP/zMUw5
 RDeftc8NNsu9+dr+aKjpWX5pzJ1rHFB0AyTwmY1HRStBnyNBT132IaoUwky71G5EAhqoEe
 e4WI6pxSM2xdt3iRAmoN9aRtweNhCpo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-tOEP7ZgvMquHeS6L6vnAyw-1; Thu,
 23 Oct 2025 10:52:59 -0400
X-MC-Unique: tOEP7ZgvMquHeS6L6vnAyw-1
X-Mimecast-MFC-AGG-ID: tOEP7ZgvMquHeS6L6vnAyw_1761231178
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5CCCA196E0B1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:52:58 +0000 (UTC)
Received: from
 rh1-jira-prod-grv-2.rh1-jira-prod-grv.rh1-jira.svc.cluster.local (unknown
 [10.30.24.183])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3632230002D7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:52:57 +0000 (UTC)
Date: Thu, 23 Oct 2025 14:52:57 +0000 (UTC)
From: "Patrick Del Bello (Jira)" <jira-issues@redhat.com>
To: dri-devel@lists.freedesktop.org
Message-ID: <JIRA.17496172.1761073453000.82567.1761231177733@Atlassian.JIRA>
In-Reply-To: <JIRA.17496172.1761073453000@Atlassian.JIRA>
References: <JIRA.17496172.1761073453000@Atlassian.JIRA>
 <JIRA.17496172.1761073453303@rh1-jira-prod-grv-2>
Subject: PSIRTSUPT-567 [PATCH] drm/vmwgfx: Validate command header size
 against SVGA_CMD_MAX_DATASIZE
MIME-Version: 1.0
X-JIRA-FingerPrint: 511e911e638d70d615ee82a6e6d8084b
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dDJL99b7f3vQd0ZrxQf51I3u_u4H3TnuBqnANwH5dvE_1761231178
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; 
 boundary="----=_Part_80424_787984999.1761229269195"
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
Reply-To: secalert-jsm-imap@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------=_Part_80424_787984999.1761229269195
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=94-=E2=80=94-=E2=80=94-=E2=80=94

Reply above this line.



Patrick Del Bello commented:

Hello folks,=C2=A0

=C2=A0

I see Rohit is cc'd in this issue together with our secalert@ email. Not su=
re if there was a conversation before or this is a request for a CVE ID. Pl=
ease let me know.



View request: https://issues.redhat.com/servicedesk/customer/portal/3/PSIRT=
SUPT-567?sda_source=3Dnotification-email

Turn off this request's notifications: https://issues.redhat.com/servicedes=
k/customer/portal/3/PSIRTSUPT-567/unsubscribe?jwt=3DeyJ0eXAiOiJKV1QiLCJhbGc=
iOiJIUzI1NiJ9.eyJxc2giOiJmMWFjM2RhZGI0OWY5YjZkNDExMjFiNjFmODNjNWJhNTI3NTRjM=
TM3N2Y3MjI5ZjBiMTRmYTRhYzZmNzdlOThhIiwiaXNzIjoic2VydmljZWRlc2stand0LXRva2Vu=
LWlzc3VlciIsImNvbnRleHQiOnsidXNlciI6IkpJUkFVU0VSMjk2MjYxIiwiaXNzdWUiOiJQU0l=
SVFNVUFQtNTY3In0sImV4cCI6MTc2MzY0ODQ2OSwiaWF0IjoxNzYxMjI5MjY5fQ.fxc5fw4-Frl=
H_bw2X4uneqvW4vpf_NLkKH0KDOHx1j8

This is shared with security@redhat.com, Rohit Keshri, bcm-kernel-feedback-=
list@broadcom.com, and 4 other people

------------------------------
JSM Help Center, powered by Jira Service Management, sent you this message.

https://www.atlassian.com/software/jira/service-management?utm_medium=3Dema=
il&utm_source=3Dservice-desk_email-notification_server&utm_campaign=3Dservi=
ce-desk_email-notification_server

------=_Part_80424_787984999.1761229269195
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org=
/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0"><base href=3D"https://issues.redhat.com">
  <style>.jsd-message-content,.jsm-message-content{margin-bottom:30px}.jsd-=
issue-link,.jsd-servicedesk-link,.jsd-unsubscribe-link,.jsm-issue-link,.jsm=
-servicedesk-link,.jsm-unsubscribe-link{color:#0052cc;text-decoration:none}=
.jsd-link-separator,.jsm-link-separator{padding:0 10px}.jsd-help-center-foo=
ter,.jsd-request-sharedwith,.jsm-help-center-footer,.jsm-request-sharedwith=
{color:#7a869a;font-size:12px}.jsd-reply-marker,.jsm-reply-marker{color:#99=
9}.jsd-reply-marker-hint,.jsm-reply-marker-hint{color:#999;margin-bottom:30=
px}.jsd-activity-item-separator,.jsm-activity-item-separator{border:none;bo=
rder-bottom:1px solid #ccc}</style>
 </head>
 <body>
  <div class=3D"jsd-reply-marker">
   =E2=80=94-=E2=80=94-=E2=80=94-=E2=80=94
  </div>
  <div class=3D"jsm-reply-marker-hint" style=3D"color: #999999; margin-bott=
om: 30px">
   Reply above this line.
  </div>
  <div class=3D"jsm-message-content" style=3D"margin-bottom: 30px">
   <div class=3D"jsd-activity-item-content">
    <p>Patrick Del Bello commented:</p>
    <p>Hello folks,&nbsp;</p>
    <p>&nbsp;</p>
    <p>I see Rohit is cc'd in this issue together with our secalert@ email.=
 Not sure if there was a conversation before or this is a request for a CVE=
 ID. Please let me know.</p>
   </div>
  </div>
  <p><a class=3D"jsm-issue-link" href=3D"https://issues.redhat.com/serviced=
esk/customer/portal/3/PSIRTSUPT-567?sda_source=3Dnotification-email" style=
=3D"color: #0052cc; text-decoration: none">View request</a> <span class=3D"=
jsm-link-separator" style=3D"padding: 0 10px">=C2=B7</span> <a class=3D"jsm=
-unsubscribe-link" href=3D"https://issues.redhat.com/servicedesk/customer/p=
ortal/3/PSIRTSUPT-567/unsubscribe?jwt=3DeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ=
9.eyJxc2giOiJmMWFjM2RhZGI0OWY5YjZkNDExMjFiNjFmODNjNWJhNTI3NTRjMTM3N2Y3MjI5Z=
jBiMTRmYTRhYzZmNzdlOThhIiwiaXNzIjoic2VydmljZWRlc2stand0LXRva2VuLWlzc3VlciIs=
ImNvbnRleHQiOnsidXNlciI6IkpJUkFVU0VSMjk2MjYxIiwiaXNzdWUiOiJQU0lSVFNVUFQtNTY=
3In0sImV4cCI6MTc2MzY0ODQ2OSwiaWF0IjoxNzYxMjI5MjY5fQ.fxc5fw4-FrlH_bw2X4uneqv=
W4vpf_NLkKH0KDOHx1j8" style=3D"color: #0052cc; text-decoration: none">Turn =
off this request's notifications</a></p>
  <p class=3D"jsm-request-sharedwith" style=3D"color: #7a869a; font-size: 1=
2px">This is shared with security@redhat.com, Rohit Keshri, bcm-kernel-feed=
back-list@broadcom.com, and 4 other people.</p>
  <p class=3D"jsm-help-center-footer" style=3D"color: #7a869a; font-size: 1=
2px">JSM Help Center, powered by <a class=3D"jsm-servicedesk-link" href=3D"=
https://www.atlassian.com/software/jira/service-management?utm_medium=3Dema=
il&amp;utm_source=3Dservice-desk_email-notification_server&amp;utm_campaign=
=3Dservice-desk_email-notification_server" style=3D"color: #0052cc; text-de=
coration: none">Jira Service Management</a>, sent you this message.</p>
 </body>
</html>
------=_Part_80424_787984999.1761229269195--

